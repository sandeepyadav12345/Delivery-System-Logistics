<?php
/**
 * Created by PhpStorm.
 * User: haitham
 * Date: 11/08/18
 * Time: 08:47 م
 */

namespace App\Traits;


use App\ClientChargedFor;
use App\Invoice;
use App\Shipment;
use Setting;

trait CourierAccounting
{
    /**
     * @param Invoice|array $input
     * @return float
     */
    public function dueFrom($input)
    {
        $sum = 0;
        // prepare the shipments we want to work with, exit if no valid shipments
        if (!($targetShipments = $this->prepareTargetShipments($input))) return false;
        if (!($targetPickups = $this->prepareTargetPickups($input))) return false;

        $shipments = $targetShipments->where('courier_id', $this->id)->courierCashed(false);

        $sum += $shipments->sum('actual_paid_by_consignee');

        $sum += $targetPickups->sum('prepaid_cash');

        return $sum;
    }

    /**
     * @param Invoice|array $input
     * @return array
     */
    public function dueFor($input)
    {
        $sum = 0;
        // prepare the shipments we want to work with, exit if no valid shipments
        if (!($targetShipments = $this->prepareTargetShipments($input))) return false;
        $shipments = $targetShipments->where('courier_id', $this->id)
            ->statusIn(['returned', 'delivered', 'rejected', 'cancelled']);

        if ($this->category == 2) {
            foreach ($shipments->get() as $shipment) {
                /** @var Shipment $shipment */
                $sum += $shipment->delivery_cost;
            }
            $share = Setting::get('accounting.freelanceShare') * $sum;
        }
        return [
            'share'     => $share ?? 0,
            'promotion' => $this->promotion($shipments->count())
        ];
    }


    public function promotion($numShipments)
    {
        if ($numShipments >= Setting::get('accounting.promoRequirement')) {
            return $numShipments * Setting::get('accounting.promoValue');
        }
        return 0;
    }
}