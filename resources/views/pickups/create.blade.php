@extends('layouts.pickups')


@section('breadcrumbs')
    {{ Breadcrumbs::render('pickups.create') }}
@endsection

@section('pageTitle')
    <i class='fa-shopping-bag'></i> @lang("pickup.create")
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <form action="{{ route('pickups.store') }}" method="post" class="pickup-form">
                    {{ csrf_field() }}
                    @include('pickups.form')
                </form>
            </div>
        </div>
    </div>
@endsection
