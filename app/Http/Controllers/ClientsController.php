<?php

namespace App\Http\Controllers;

use App\Client;
use App\ClientChargedFor;
use App\ClientLimit;
use App\Http\Requests\StoreClientRequest;
use App\PaymentMethod;
use App\PickupStatus;
use App\Shipment;
use App\Status;
use App\User;
use App\Zone;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ClientsController extends Controller
{

    /**
     * @var ShipmentFilters
     */
    private $shipmentFilters;

    public function __construct()
    {
        $this->shipmentFilters = new ShipmentFilters();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function index()
    {
        $this->authorize('index', Client::class);

        $clients = Client::all();
        return view('clients.index', [
            'clients'   => $clients,
            'pageTitle' => trans('client.label')
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function create()
    {
        $this->authorize('create', Client::class);

        $countries      = \Countries::lookup();
        $zones          = Zone::all();
        $paymentMethods = PaymentMethod::all();

        return view('clients.create')->with([
            'countries'           => $countries,
            'zones'               => $zones,
            'paymentMethods'      => $paymentMethods,
            'next_account_number' => Client::nextAccountNumber(),
            'pageTitle'           => trans('client.create')
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreClientRequest $request)
    {
        $client = new Client;

        $this->savePersonalData($request, $client);
        $this->saveAccountingData($request, $client);
        $this->saveEmailsSettings($request, $client);
        $client->zone()->associate(Zone::findOrFail($request->get('zone_id', 0)));
        $client->pickup_address = $request->get('pickup_address', []);

        $client->note_for_courier = $request->get('note_for_courier');

        $client->push();
        $this->chargeFor($client, $request);
        $client->createUser();
        $client->uploadAttachments($request->file('client_files'));

        return redirect()->route('clients.index');
    }

    /**
     * Display the specified resource.
     *
     * @param Client $client
     * @param string $tab
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function show(Client $client, Request $request, $tab = "statistics")
    {
        $data = [
            'client'         => $client,
            'tab'            => $tab,
            'pageTitle'      => $client->trade_name,
            'shipmentsCount' => $client->shipments()->count(),
            'pickupsCount'   => $client->pickups()->count(),
        ];

        switch ($tab) {
            case 'statistics':
                $this->appendStatsData($data, $client, $request);
                break;
            case 'shipments':
                $this->getShipmentsData($data, $client, $request);
                break;
            case 'pickups':
                $pickups = $client->pickups();
                if ($request->has('start')) {
                    $startDate = Carbon::createFromTimestamp($request->get('start'));
                    $pickups->whereDate('available_time_start', '>=', $startDate);
                }
                if ($request->has('end')) {
                    $endDate = Carbon::createFromTimestamp($request->get('end'));
                    $pickups->whereDate('available_time_end', '<=', $endDate);
                }

                $statuses                = PickupStatus::all();
                $data['pickups']         = $pickups->simplePaginate();
                $data['statuses']        = $statuses;
                $data['statusesOptions'] = PickupsController::statusesOptions($statuses);
                $data['startDate']       = $data['endDate'] = false;
                break;
            case 'zones':
                $data['zones']       = Zone::all();
                $data['customZones'] = $client->customZones()->get();
                break;
            case 'edit':
                $data['countries'] = \Countries::lookup();
                $data['zones']     = Zone::all();
                break;
        }
        return view('clients.show', $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Client $client
     * @param $section
     * @return \Illuminate\Http\Response
     */
    public function edit(Client $client, $section = 'personal')
    {
        $data = [
            'client'         => $client,
            'countries'      => \Countries::lookup(),
            'zones'          => Zone::all(),
            'paymentMethods' => PaymentMethod::all(),
            'pageTitle'      => trans('client.edit') . ' ' . $client->trade_name,
            'tab'            => 'edit',
            'section'        => $section,
            'shipmentsCount' => $client->shipments()->count(),
            'pickupsCount'   => $client->pickups()->count(),
            'chargedForData' => []
        ];
        if ($section === 'accounting') {
            $data['chargedForData']['returnedChargeOn'] = ClientChargedFor::byStatus('returned')->first()->options ?? [
                    'rejected'  => false,
                    'cancelled' => false,
                ];
        }
        return view('clients.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param Client $client
     * @param string $section
     * @return Response
     */
    public function update(Request $request, Client $client)
    {
        $section = $request->get('section');
        switch ($section) {
            case 'personal':
                $this->savePersonalData($request, $client);
                $client->note_for_courier = $request->get('note_for_courier');
                $client->zone()->associate(Zone::findOrFail($request->get('zone_id', 0)));
                $client->pickup_address = $request->get('pickup_address', []);
                $client->push();
                break;
            case 'accounting':
                $this->saveLimits($request, $client);
                $this->saveAccountingData($request, $client);
                $this->chargeFor($client, $request);
                $client->push();
                break;
            case 'attachments':
                $request->validate([
                    'client_files.*' => 'required|file|max:5000|mimes:jpg,jpeg,png,gif,pdf,doc,docx,xsl,xslx',
                ],
                    [
                        'max'   => "The file cannot be greater than 5 MB",
                        'mimes' => "The file must be of type :values"
                    ]);
                if ($request->hasFile('client_files'))
                    $client->uploadAttachments($request->file('client_files'));
                break;
            case 'emails':
                $this->saveEmailsSettings($request, $client);
                $client->push();
                break;
        }
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Client $client
     * @return \Illuminate\Http\Response
     */
    public function destroy(Client $client)
    {
        try {
            $client->delete();
        } catch (\Exception $ex) {

        }
        return redirect()->route('clients.index')->with([
            'alert' => (object)[
                'type' => 'success',
                'msg'  => trans("client.deleted")
            ]
        ]);
    }


    public function savePersonalData(Request $request, Client &$client)
    {
        $client->trade_name   = $request->trade_name;
        $client->national_id  = $request->national_id;
        $client->password     = User::generatePassword();
        $client->name         = $request->name;
        $client->phone_number = $request->get('phone_number', null);
        $client->email        = $request->get('email', null);
        $client->address      = $request->get('address', []);
        $client->urls         = $request->get('urls', []);
        $client->sector       = $request->get('sector', null);
        $client->category     = $request->get('category', null);
    }

    public function saveAccountingData(Request $request, Client &$client)
    {
        $client->bank = $request->get('bank', []);
        if ($request->has(['payment_method', 'payment_method_price'])) {
            $client->paymentMethod()->associate($request->get('payment_method'));
            $client->payment_method_price = $request->get('payment_method_price');
        }
    }

    public function saveLimits(Request $request, Client &$client)
    {
        foreach (['min_delivery_cost', 'max_returned_shipments'] as $item) {
            if ($client->limits()->whereName($item)->exists())
                $limit = $client->limits()->whereName($item)->first();
            else {
                $limit = new ClientLimit(['name' => $item]);
                $limit->client()->associate($client);
            }
            $itemData = $request->get($item, []);
            if (!count($itemData)) continue;

//            dd($itemData);
            $limit->value     = $itemData['value'];
            $limit->appliedOn = $itemData['target'] ?? [];
            $limit->penalty   = $itemData['penalty'];
            $limit->type      = $itemData['type'];
            $limit->save();
        }
    }


    private function chargeFor(Client $client, Request $request)
    {
        $chargedForItems  = $request->get('chargedFor', []);
        $savedStatuses    = $client->chargedForStatuses();
        $receivedStatuses = array_keys($chargedForItems);
        $toDelete         = array_diff($savedStatuses, $receivedStatuses);

        foreach ($toDelete as $item) {
            /** @var ClientChargedFor $cf */
            $cf = $client->chargedFor()->byStatus($item)->first();
            try {
                $cf->enabled = false;
                $cf->save();
            } catch (\Exception $e) {
            }
        }
        foreach ($chargedForItems as $statusName => $item) {
            $fields = ['enabled', 'value', 'type'];
            if (!is_array($item) || !empty(array_diff($fields, array_keys($item)))) continue;
            if ($statusName !== 'returned') {
                $status = Status::name($statusName)->first();
                if (is_null($status)) continue;
            } else {
                $status = -1;
            }
            if ($client->chargedFor()->byStatus($statusName)->exists())
                $chargedFor = $client->chargedFor()->byStatus($statusName)->first();
            else {
                $chargedFor = new ClientChargedFor;
                $chargedFor->status()->associate($status);
                $chargedFor->client()->associate($client);
            }
            $chargedFor->enabled = $item['enabled'] == "on";
            $chargedFor->type    = $item['type'];
            $chargedFor->value   = $item['value'];
            if ($statusName == 'returned') {
                $options             = [
                    'rejected'  => isset($item['rejected']),
                    'cancelled' => isset($item['cancelled']),
                ];
                $chargedFor->options = $options;
            }

            $chargedFor->save();
        }

    }

    protected function appendStatsData(array &$data, Client $client, Request $request)
    {
        $start_time        = strtotime("-29 days");
        $end_time          = time();
        $start             = $request->get('start', $start_time);
        $end               = $request->get('end', $end_time);
        $data['startDate'] = $start;
        $data['endDate']   = $end;
        try {
            $begin              = Carbon::createFromTimestamp($request->get('start', $start));
            $until              = Carbon::createFromTimestamp($request->get('end', $end));
            $data['statistics'] = $client->statistics($begin, $until);
        } catch (\Exception $ex) {
            $begin              = Carbon::createFromTimestamp($start_time);
            $until              = Carbon::createFromTimestamp($end_time);
            $data['statistics'] = $client->statistics($begin, $until);
            $data['alert']      = (object)[
                'type' => 'danger',
                'msg'  => "Date range provided is invalid"
            ];
        }
        $data['daterange'] = $begin->toFormattedDateString() . ' - ' . $until->toFormattedDateString();
    }

    private function getShipmentsData(array &$data, Client $client, Request $request)
    {
        $shipmentsQuery = $client->shipments();
        if ($request->has('start'))
            $shipmentsQuery->whereDate('delivery_date', '>=', Carbon::createFromTimestamp($request->get('start')));
        if ($request->has('end'))
            $shipmentsQuery->whereDate('delivery_date', '<=', Carbon::createFromTimestamp($request->get('end')));
        $filters             = $this->shipmentFilters->applyFilters($shipmentsQuery, $request->get('filters', []));
        $data['shipments']   = $shipmentsQuery->get();
        $data['filtersData'] = $this->shipmentFilters->filtersData();
        $data['applied']     = $filters;
    }

    private function saveEmailsSettings($request, Client &$client)
    {
        $client->shipments_email_updates = $request->get('shipments_email_updates', false) === 'on';
        $client->secondary_emails        = $request->get('secondary_emails', null);
    }
}
