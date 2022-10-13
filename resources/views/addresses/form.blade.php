@php
    if(isset($bulk) && $bulk)
        $action = route('addresses.bulkUpdate');
    else
        $action = isset($address) ? route('address.update', ['zone'=>$zone->id, 'address'=>$address->id]) : route('address.store', ['zone' => $zone->id])
@endphp
<form id="createAddressForm" action="{{ $action }}" method="post">

    @if(isset($address) || (isset($bulk) && $bulk))
        {{ method_field('PUT') }}
    @endif
    @if(!isset($ajax) || !$ajax)
        {{ csrf_field() }}
    @endif
    <input type="hidden" name="addresses">
    <div class="form-row">
        @if(!isset($bulk) || !$bulk)
            <div class="form-group col-sm-12">
                <label for="name">@lang('zone.address.name')</label>
                <input type="text" class="form-control" name="name" id="name" value="{{ $address->name ?? "" }}"
                       placeholder="@lang('zone.address.name')">
            </div>
        @endif
        <div class="form-group col-sm-6">
            <label for="sameday_price">@lang('zone.address.sameday_price')</label>
            <input type="number" step="0.01" class="form-control" name="sameday_price" id="sameday_price"
                   value="{{ $address->sameday_price ?? "" }}"
                   placeholder="@lang('zone.address.sameday_price')">
        </div>
        <div class="form-group col-sm-6">
            <label for="scheduled_price">@lang('zone.address.scheduled_price')</label>
            <input type="number" step="0.01" class="form-control" name="scheduled_price" id="schedulded_price"
                   value="{{ $address->scheduled_price ?? "" }}"
                   placeholder="@lang('zone.address.scheduled_price')">
        </div>
    </div>
    <div class="d-flex flex-row-reverse">
        <button class="btn btn-primary ml-auto" type="submit"><i
                    class="fa fa-save mr-2"></i> {{ isset($address) || (isset($bulk) && $bulk) ? trans('zone.address.save') : trans('zone.address.new') }}
        </button>
        <a class="btn btn-outline-secondary" data-dismiss="modal" href="{{ route('zones.edit', [$zone]) }}">@lang('common.cancel')</a>
    </div>
</form>