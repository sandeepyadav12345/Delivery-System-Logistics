@php
    /** @var App\Invoice $invoice */
    /** @var App\Guest $client */
@endphp

@extends('layouts.invoice')


@section('invoiceContent')
    <tr>
        <td class="text-center" colspan="2"><b style="font-size: 1.1rem;">@lang('accounting.statement')</b></td>
    </tr>
    <tr>
        <td colspan="2" class="invoice__statement-table">
            <div class="row">
                <div class="col-6">
                    <table>
                        <tbody>
                        <tr>
                            <th>@lang('accounting.to')</th>
                            <td>{{ $client->trade_name }}</td>
                        </tr>
                        <tr>
                            <th>@lang('accounting.address')</th>
                            <td>{{ $client->country }}, {{ $client->city }}</td>
                        </tr>
                        <tr>
                            <th>@lang('accounting.telephone')</th>
                            <td>{{ $client->phone_number }}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-12">
                            <table>
                                <tbody>
                                <tr>
                                    <th>@lang('accounting.invoice_no')</th>
                                    <td>{{ $invoice->id }}</td>
                                </tr>
                                <tr>
                                    <th>@lang('accounting.invoice_date')</th>
                                    <td>{{ $invoice->created_at->toFormattedDateString() }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-12 mt-2">
                            <table>
                                <tbody>
                                <tr>
                                    <th>@lang('accounting.invoice_period')</th>
                                    <td>{{ $invoice->period }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>

        </td>
    </tr>

    <tr>
        <td colspan="2">
            <table class="table invoice-table table-bordered">
                <thead>
                <tr role="row" class="head-tr">
                    <th class="">#</th>
                    <th>@lang('accounting.hawb')</th>
                    <th>@lang('accounting.status')</th>
                    <th>@lang('accounting.delivery_date')</th>
                    <th>@lang('accounting.address')</th>
                    <th>@lang('accounting.service_type')</th>
                    <th>@lang('accounting.weight')</th>
                    <th>@lang('accounting.pieces')</th>
                    <th>@lang('accounting.shipment_value')</th>
                    <th>@lang('accounting.collected_value')</th>
                    <th>@lang('accounting.base_charge')</th>
                    <th>@lang('accounting.extra_fees')</th>
                    <th>@lang('accounting.extra_services')</th>
                    <th>@lang('accounting.net')</th>
                </tr>
                </thead>
                <tbody>
                @php $i = 0; @endphp
                @foreach($shipments as $shipment)
                    @php /** @var \App\Shipment $shipment */ @endphp
                    <tr>
                        <td rowspan="2" class="separator-bottom">{{ ++$i }}</td>
                        <td>{{ $shipment->waybill }}</td>
                        <td>@lang("shipment.statuses.".$shipment->status->name)</td>
                        <td>{{ $shipment->delivery_date->toFormattedDateString() }}</td>
                        <td>{{ $shipment->address->zone->name }}</td>
                        <td>@lang("accounting.service_types.".$shipment->service_type)</td>
                        <td>{{ $shipment->package_weight }}</td>
                        <td>{{ $shipment->pieces }}</td>
                        <td>{{ fnumber($shipment->shipment_value) }}</td>
                        <td>{{ fnumber($shipment->actual_paid_by_consignee) }}</td>
                        @if($shipment->isPriceOverridden())
                            <td colspan="3">{{ fnumber($shipment->base_charge) }}</td>
                        @else
                            <td>{{ fnumber($shipment->base_charge) }}</td>
                            <td>{{ fnumber($shipment->extra_fees) }}</td>
                            <td>{{ fnumber($shipment->services_cost) }}</td>
                        @endif
                        <td class="font-weight-bold text-center separator-bottom"
                            rowspan="2">{{ fnumber($shipment->delivery_cost) }}</td>
                    </tr>
                    <tr>
                        <td colspan="12" class="light-bg separator-bottom">
                            <div>
                                @lang('accounting.operational_details'):
                                <ul class="operational-details">
                                    <li><b>@lang('accounting.consignee_info')
                                            :</b> {{ $shipment->consignee_name }}
                                        , {{ $shipment->phone_number }} , {{ $shipment->address->name }}</li>
                                    @if($shipment->services->count())
                                        <li><b>@lang('accounting.extra_services'):</b>
                                            @foreach($shipment->services as $service)
                                                @php /** @var \App\Service $service */ @endphp
                                                <span class="invoice__service-item">({{ $service->name }}
                                                    , @if ($custom_service = $service->customFor($client))
                                                        {{ fnumber($custom_service->pivot->price) }}
                                                    @else {{ fnumber($service->price) }} @endif
                                                    )</span>
                                            @endforeach
                                        </li>
                                    @endif
                                </ul>
                            </div>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="invoice__summery">
            <h3>@lang('accounting.summery')</h3>
            <table class="invoice__summery-table">
                <tbody>
                <tr>
                    <th>@lang('accounting.client_payment') <small class="text-muted">- Prepaid cashed by the client.</small></th>
                    <td><span class="currency">@lang('common.jod')</span>{{ fnumber($invoice->payment) }}
                    </td>
                </tr>
                <tr>
                    <th>@lang('accounting.client_due_for')</th>
                    <td><span class="currency">@lang('common.jod')</span>{{ fnumber($invoice->due_for) }}
                    </td>
                </tr>
                <tr>
                    <th>@lang('accounting.client_due_from')</th>
                    <td><span class="currency">@lang('common.jod')</span>{{ fnumber($invoice->due_from) }}
                    </td>
                </tr>
                <tr>
                    <th {{{ $invoice->terms_applied ? "rowspan='2'" : "" }}}>@lang('accounting.terms_applied')</th>
                    <td>{{ $invoice->the_discount }}</td>
                </tr>
                @if($invoice->terms_applied)
                    <tr>
                        <td>
                            <span class="currency">@lang('common.jod')</span>{{ fnumber($invoice->terms_applied) }}
                        </td>
                    </tr>
                @endif
                <tr>
                    <th>@lang('accounting.pickups_fees')</th>
                    <td>
                        <span class="currency">@lang('common.jod')</span>{{ fnumber($invoice->pickup_fees) }}
                    </td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <th>@lang('accounting.total_net')</th>
                    <td><span class="currency">@lang('common.jod')</span>{{ fnumber($invoice->total) }}</td>
                </tr>
                </tfoot>
            </table>
        </td>
    </tr>
@endsection