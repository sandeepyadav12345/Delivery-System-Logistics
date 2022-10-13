@php /** @var App\Invoice $invoice */ @endphp

@extends('layouts.print')


@section('content')

    <div class="container">

        <section class="invoice sheet padding-10mm">
            <table>
                <tr>
                    <td class="invoice-logo" colspan="2">
                        <img src="/images/logo-one.png" alt="Logo">
                    </td>
                </tr>
                <tr>
                    <td class="invoice__company-details" colspan="2">
                        {{ Setting::get('company.name') }}
                        <br>
                        @lang('settings.company.pobox'): {{ Setting::get('company.pobox') }}
                        <br>
                        {!! nl2br(e(Setting::get('company.address')))  !!}
                        <br>
                        @lang('accounting.telephone'): {{ Setting::get('company.telephone') }}
                        <br>
                        TRC NO. : {{ Setting::get('company.trc') }}
                    </td>
                </tr>
                @yield('invoiceContent')
            </table>
        </section>

    </div>
@endsection