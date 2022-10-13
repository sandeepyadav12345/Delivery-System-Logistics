@extends('layouts.base')

@section('base')
    <div class="sidebar">
        <div class="logopanel">
            <!-- <h1 style="background-image: url({{ asset('/images/logo-sm-white.png') }});"></h1> -->
               <img style="height: 50px; width:175px;" src="/images/delivery-four.png">
           <!--  <p style="color:white;">Delivery System </p> -->
        </div>
    </div>
    <div class="container mt-2">
        @include("shipments.tabs.status")
    </div>
@endsection