<div class="container">
    <h3>Shipment Change Log</h3>
    @if($revisionHistory->count())
        <ul class="list-group shipment-history shipment-log flex-column-reverse mt-3">
            @foreach($revisionHistory as $history)
                @php /** @var \Venturecraft\Revisionable\Revision $history */ @endphp
                @if(!(empty($history->old_value) && empty($history->new_value)))
                    <li class="list-group-item">
                        <small class="history-date">{{ $history->created_at->toDayDateTimeString() }}</small>
                        {!! $history->userResponsible() instanceof App\User ? '<small>By '.$history->userResponsible()->display_name . '</small>' : '' !!}
                        <div class="font-weight-bold py-2">
                            @if($history->key === 'created_at' && !$history->old_value)
                                Shipment has been created
                            @elseif($history->key === 'extra_services')
                                @if(!empty($history->old_value))
                                    `{{ $history->oldValue() }}` has been removed
                                    from {{ trans('shipment.'.$history->fieldName()) }}
                                @endif
                                @if(!empty($history->new_value))
                                    `{{ $history->newValue() }}` has been added
                                    to {{ trans('shipment.'.$history->fieldName()) }}
                                @endif
                            @else

                                {{ is_array(trans('shipment.'.$history->fieldName())) ? trans('shipment.'.$history->fieldName().'.label') : trans('shipment.'.$history->fieldName()) }}
                                from `<u>{{ $history->oldValue() }}</u>`
                                to `<u>{{ $history->newValue() }}</u>`
                            @endif
                        </div>
                    </li>
                @endif

            @endforeach
        </ul>

    @else
        <div class="py-4 px-1 text-center border-dark">No history!</div>
    @endif
</div>