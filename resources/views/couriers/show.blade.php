@extends('layouts.couriers')

@section('breadcrumbs')
    {{ Breadcrumbs::render('couriers') }}
@endsection

@section('pageTitle')
    <i class='fa-user-tie'></i> [{{ $courier->name }}]
@endsection

@section('actionsFirst')
    @if($tab == "statistics")
        <div id="reportrange" class="btn btn-outline-secondary" data-start-date="{{ $startDate}}"
             data-end-date="{{ $endDate}}" data-lifetime-range="false">
            <i class="fa fa-calendar"></i>&nbsp;
            <span></span> <i class="fa fa-caret-down"></i>
        </div>
    @endif
@endsection

@section('content')

    <div class="container-fluid mt-4">
        @include('layouts.partials.overviewStats')
    </div>
@endsection

@section('beforeBody')
    <script>
                @foreach($statistics->statuses['values'] as $status => $values)
        var ctx = document.getElementById("{{ $status }}Chart").getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: [{!! implode(',',$statistics->statuses['labels'])  !!}],
                datasets: [
                    {
                        label: "{{ $values['label'] }}",
                        data: {!! json_encode(array_values($values['data'])) !!}
                    },
                ]
            },
            options: {
                scales: {
                    yAxes: [{
                        display: true,
                        ticks: {
                            min: 0,
                            stepSize: 1,
                            suggestedMax: 5
                        }
                    }]
                },
            }
        });
        @endforeach

    </script>
@endsection