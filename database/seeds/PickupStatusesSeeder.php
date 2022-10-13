<?php

use App\PickupStatus;
use Illuminate\Database\Seeder;

class PickupStatusesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        PickupStatus::truncate();

        PickupStatus::create([
            'name'    => "created",
        ]);
        PickupStatus::create([
            'name'    => "ready",
            'options' => [
                'set_available_time' => true
            ],
        ]);
        PickupStatus::create([
            'name'    => "rescheduled",
            'options' => [
                'select'             => [
                    'rescheduled_by' => ['By Client', 'By Kangaroo'],
                ],
                'set_available_time' => true,
                'set_address'        => true
            ]
        ]);
        PickupStatus::create([
            'name' => "pass_to_office",
        ]);
        PickupStatus::create([
            'name'    => "rejected",
            'options' => [
                'select' => [
                    'reason' => [
                        "Client didn't answer on arrival",
                        "Client cancelled on arrival",
                        "Client's mobile is switched off on arrival",
                        "Client refused to pay cash on pick up",
                        "Client didn't ask for pick up",
                        "Client mobile is transferred",
                    ]
                ]
            ]
        ]);
        PickupStatus::create([
            'name'    => "cancelled",
            'options' => [
                'select'         => [
                    'reason' => [
                        "Client cancelled the pick up",
                        "Client didn't ask for pick up",
                        "By Kangaroo",
                    ]
                ],
                'notes_required' => true
            ]
        ]);
        PickupStatus::create([
            'name'    => "not_available",
            'options' => [
                'select' => [
                    'reason' => [
                        "Transferred calls",
                        "Number blocked",
                        "No answer",
                        "Incorrect number",
                        "Invalid number",
                        "Number disconnected",
                        "No signal/coverage",
                        "Mobile switched off",
                    ]
                ],
            ]
        ]);
        PickupStatus::create([
            'name'    => "failed",
            'options' => [
                'select' => [
                    'reason' => [
                        "Bad weather conditions",
                        "Unreachable destination",
                    ]
                ],
            ]
        ]);
        PickupStatus::create([
            'name'    => "on_hold",
            'options' => [
                'select' => [
                    'reason' => [
                        "Incomplete address",
                        "No phone number",
                    ]
                ],
            ]
        ]);

        PickupStatus::create([
            'name' => "collected",
            'options' => [
                'prepaid_cash'    => true,
                'actual_packages' => true
            ]
        ]);
    }
}
