@php /** @var \App\Shipment $shipment */ @endphp

@extends('layouts.print')

@section('content')
    <div class="container">

        <section class="shipments-print sheet ">
            <table class="w-100" cellpadding="6">
                <tr>
                    <td colspan="2" class="border-bottom">
                        <div class="d-flex justify-content-between p-3 align-items-center">

                            <div class="invoice-logo" style="flex: 1;">
                                <img src="/images/logo-one.png" alt="Logo" style="height: 80px;">
                            </div>
                            <div class="text-center" style="flex: 2;">
                                @if($shipment->isReturnedShipment())
                                    <h1>
                                        Return Shipment
                                    </h1>
                                @else
                                    <h1>Shipment Details</h1>
                                @endif
                            </div>
                            <div style="flex: 1;">
                                <div class="text-right">
                                    <b>Printed By: </b> {{ auth()->user()->username }}
                                    <br>
                                    <b>Date: </b> {{ now()->toFormattedDateString() }}
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        @if($shipment->isReturnedShipment())
                            @component('shipments.print.returned-details', ['shipment' => $shipment]) @endcomponent
                        @else
                            @component('shipments.print.details', ['shipment' => $shipment]) @endcomponent
                        @endif
                    </td>
                </tr>

                @if(!$shipment->isReturnedShipment())
                    <tr>
                        <td colspan="2">
                            @include('shipments.partials.conditions-of-carriage')
                        </td>
                    </tr>
                @endif

            </table>

        </section>
    </div>
@endsection