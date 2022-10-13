<?php

namespace App;


use App\Interfaces\Accountable;
use App\Interfaces\CanHaveShipment;
use App\Notifications\ClientCreated;
use App\Traits\ClientAccounting;
use App\Traits\StatisticsTrait;
use App\Traits\HasAttachmentsTrait;
use App\Traits\PrepareAccounting;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;

/**
 * @property int account_number
 * @property string name
 * @property string trade_name
 * @property string password
 * @property string phone_number
 * @property string email
 * @property string|array secondary_emails
 *
 * @property User user
 * @property Zone zone
 *
 * @property string category
 * @property string sector
 *
 * @property string address_pickup_text
 * @property string address_pickup_maps
 *
 * @property string address_country
 * @property string address_city
 * @property string address_sub
 * @property string address_maps
 *
 * @property string bank_name
 * @property string bank_account_number
 * @property string bank_holder_name
 * @property string bank_iban
 * @property string swift_code
 *
 * @property mixed url_instagram
 * @property mixed url_website
 * @property mixed url_facebook
 * @property object address
 * @property object pickup_address
 * @property object bank
 * @property object urls
 * @property string national_id
 * @property boolean shipments_email_updates
 * @property string note_for_courier
 *
 * @property float min_delivery_cost
 * @property integer max_returned_shipments
 *
 * @property Collection attachments
 * @property int payment_method_id
 * @property PaymentMethod payment_method
 * @property float payment_method_price
 *
 * @method static self createdToday()
 *
 * @mixin Builder
 */
class Client extends Model implements Accountable, CanHaveShipment
{
    use SoftDeletes, HasAttachmentsTrait;
    use PrepareAccounting, ClientAccounting, StatisticsTrait;
    use Notifiable;

    protected $dates = ['deleted_at'];

    protected $primaryKey = "account_number";

    protected $folderToUpload = 'clients';

    protected $fillable = [
        'account_number',
        'name',
        'trade_name',
        'password',
        'phone_number',
        'email',
        'secondary_emails',
        'address_country',
        'address_city',
        'address_sub',
        'address_maps',
        'address_pickup_text',
        'address_pickup_maps',
        'url_facebook',
        'url_instagram',
        'url_website',
        'sector',
        'category',
        'bank_name',
        'bank_account_number',
        'bank_holder_name',
        'bank_iban',
        'swift_code',
        'alerted',
        'max_returned_shipments',
        'min_delivery_cost',
        'national_id',
        'shipments_email_updates',
        'note_for_courier'
    ];

    public static function boot()
    {
        parent::boot();

        static::created(function (self $client) {
            $client->notify(new ClientCreated());
        });

        static::deleting(function(self $instance) {
            $instance->user->delete();
        });
    }

    public function getAddressAttribute()
    {
        return (object)[
            'country' => $this->address_country,
            'city'    => $this->address_city,
            'sub'     => $this->address_sub,
            'maps'    => $this->address_maps,
            'full'    => $this->address_sub . "\n\r" . $this->address_country . ", " . $this->address_city
        ];
    }

    public function getPickupAddressAttribute()
    {
        return (object)[
            'text' => $this->address_pickup_text,
            'maps' => $this->address_pickup_maps,
        ];
    }

    public function getBankAttribute()
    {
        return (object)[
            'name'           => $this->bank_name,
            'account_number' => $this->bank_account_number,
            'holder_name'    => $this->bank_holder_name,
            'iban'           => $this->bank_iban,
            'swift_code'     => $this->swift_code,
            'full'           => $this->bank_name . " - " . $this->bank_holder_name . '<br>' . $this->bank_account_number
        ];
    }

    public function getUrlsAttribute()
    {
        return (object)[
            'website'   => $this->url_website,
            'facebook'  => $this->url_facebook,
            'instagram' => $this->url_instagram,
        ];
    }

    public function setAddressAttribute($val)
    {
        $this->address_country = isset($val['country']) ? $val['country'] : $this->address_country;
        $this->address_city    = isset($val['city']) ? $val['city'] : $this->address_city;
        $this->address_sub     = isset($val['sub']) ? $val['sub'] : $this->address_sub;
        $this->address_maps    = isset($val['maps']) ? $val['maps'] : $this->address_maps;
    }

    public function setPickupAddressAttribute($val)
    {
        $this->address_pickup_text = isset($val['text']) ? $val['text'] : $this->address_pickup_text;
        $this->address_pickup_maps = isset($val['maps']) ? $val['maps'] : $this->address_pickup_maps;
    }

    public function setBankAttribute($val)
    {
        $this->bank_name           = isset($val['name']) ? $val['name'] : $this->bank_name;
        $this->bank_account_number = isset($val['account_number']) ? $val['account_number'] : $this->bank_account_number;
        $this->bank_holder_name    = isset($val['holder_name']) ? $val['holder_name'] : $this->bank_holder_name;
        $this->bank_iban           = isset($val['iban']) ? $val['iban'] : $this->bank_iban;
        $this->swift_code          = isset($val['swift_code']) ? $val['swift_code'] : $this->swift_code;
    }

    public function setUrlsAttribute($val)
    {
        if (array_key_exists('website', $val))
            $this->url_website = $val['website'];
        if (array_key_exists('facebook', $val))
            $this->url_facebook = $val['facebook'];
        if (array_key_exists('instagram', $val))
            $this->url_instagram = $val['instagram'];
    }

    public function setSecondaryEmailsAttribute($value)
    {

        if (is_null($value) || empty(trim($value))) {
            $this->secondary_emails = "";
        } else {
            $emails    = explode(',', trim($value));
            $validated = [];
            foreach ($emails as $email) {
                if (filter_var(trim($email), FILTER_VALIDATE_EMAIL))
                    $validated[] = trim($email);
            }
            $this->attributes['secondary_emails'] = implode(',', $validated);
        }
    }

    public function getSecondaryEmailsAttribute()
    {
        if(is_null($this->attributes['secondary_emails']) || empty($this->attributes['secondary_emails']))
            return [];
        return explode(',', $this->attributes['secondary_emails']);
    }


    public function createUser()
    {
        if (!is_null($this->user)) return $this->user;

        $user_template = UserTemplate::where('name', 'client')->first();
        if (is_null($user_template)) UserTemplate::default()->first();

        $user           = new User;
        $user->username = $this->account_number;
        $user->email    = $this->email;
        $user->password = Hash::make($this->password);
        $user->template()->associate($user_template);
        $user->client()->associate($this);
        $user->save();

        return $user;
    }

    public function user()
    {
        return $this->hasOne(User::class, 'identifier', 'account_number');
    }

    public function scopeNotAlerted(Builder $query)
    {
        return $query->where('alerted', false);
    }

    public function scopeCreatedToday(Builder $builder)
    {
        return $builder->whereDate('created_at', ">", now()->startOfDay());
    }

    public function zone()
    {
        return $this->belongsTo(Zone::class);
    }

    public function pickups()
    {
        return $this->hasMany(Pickup::class, 'client_account_number', 'account_number');
    }

    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class);
    }

    public function chargedFor()
    {
        return $this->hasMany(ClientChargedFor::class);
    }

    public function chargedForStatuses()
    {
        $ids = $this->chargedFor()->pluck('status_id')->toArray();
        $statuses = Status::whereIn('id', $ids)->pluck('name')->toArray();
        if(in_array('-1', $ids)) $statuses[] = 'returned';
        return $statuses;
    }


    public function limits()
    {
        return $this->hasMany(ClientLimit::class, 'client_account_number', 'account_number');
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany|Shipment
     */
    public function shipments()
    {
        return $this->hasMany(Shipment::class, 'client_account_number', 'account_number');
    }

    public function customServices()
    {
        return $this->belongsToMany(Service::class)->withPivot('price');
    }

    public function customZones()
    {
        return $this->hasMany(CustomZone::class);
    }

    public function customAddresses()
    {
        return $this->hasMany(CustomAddress::class);
    }

    /**
     * @param string $statusName
     * @return bool
     */
    public function isChargedFor(string $statusName)
    {
        $cf = $this->chargedFor()->byStatus($statusName)->first();
        if (!is_null($cf))
            return $cf->enabled;
        return null;
    }

    public function resetAlert()
    {
        return $this->update(['alerted', false]);
    }

    public function pickupFeesPaid()
    {
        return $this->update(['is_fees_paid' => true]);
    }

    public static function findByAccNum(int $account_number, bool $withTrashed = false): Client
    {
        if ($withTrashed)
            return self::withTrashed()->where('account_number', $account_number)->first();
        return self::where('account_number', $account_number)->first();
    }

    /**
     * @return string
     */
    public function color()
    {
        // This function reason is to return true if the client has a shipment that did not reach a dead end status ()

        /* Red Color (Money !) */
        $unpaid_orders = $this->shipments()->unpaid()->count();
        if ($unpaid_orders > 0) {
            return Config::get('constants.color.red');
        }
        /* Orange Color */
        $pending_orders = $this->shipments()->pending()->count();
        if ($pending_orders > 0) {
            return Config::get('constants.color.orange');
        }

        return Config::get('constants.color.black');
    }

    /**
     * Change Client password
     * @param string $newPass
     * @return bool
     */
    public function changePassword(string $newPass)
    {
        // change associated user's password first
        if ($this->user->changePassword($newPass))
            // then change the client's password
            return $this->fill([
                'password' => $newPass
            ])->save();
        return false;
    }

    /**
     * Get next client account number
     * @return integer
     */
    public static function nextAccountNumber()
    {
        $statement = DB::select("SHOW TABLE STATUS LIKE 'clients'");
        return $statement[0]->Auto_increment;
    }

    public function identifiableName()
    {
        return $this->name;
    }

    public static function routes()
    {
        Route::get('clients/create', "ClientsController@create")->name('clients.create');
        Route::get('clients/{client}/edit/{section?}', "ClientsController@edit")->name('clients.edit');
        Route::resource('clients', "ClientsController")->except(['show', 'create', 'edit']);

        // clients custom services
        Route::get('clients/{client}/services', "ClientServicesController@index")->name('clients.services.index');
        Route::post('clients/{client}/services/{service}', "ClientServicesController@store")->name('clients.services.store');
        Route::put('clients/{client}/services/{service}', "ClientServicesController@update")->name('clients.services.update');

        // clients custom zones
        Route::post('clients/{client}/zones', "ClientZonesController@store")->name('clients.zones.store');
        Route::get('clients/{client}/zones', "ClientZonesController@index")->name('clients.zones.index');
        Route::get('clients/{client}/zones/{zone}', "ClientZonesController@show")->name('clients.zones.show');
        Route::put('clients/{client}/zones/{zone}', "ClientZonesController@update")->name('clients.zones.update');
        Route::delete('clients/{client}/zones/{zone}', "ClientZonesController@destroy")->name('clients.zones.destroy');

        // clients custom addresses
        Route::put('clients/{client}/addresses/{address}', "CustomAddressesController@update")->name('clients.addresses.update');
        Route::post('clients/{client}/addresses', "CustomAddressesController@store")->name('clients.addresses.store');
        Route::post('clients/{client}/addresses/bulk', "CustomAddressesController@bulk")->name('clients.addresses.bulk');
        Route::get('clients/{client}/zones/{zone}/addresses', "CustomAddressesController@index")->name('clients.addresses.index');
        Route::delete('clients/{client}/addresses', "CustomAddressesController@bulkDestroy")->name('clients.addresses.bulkDestroy');
        Route::delete('clients/{client}/addresses/{address}', "CustomAddressesController@destroy")->name('clients.addresses.destroy');

        // clients tabs
        Route::get('clients/{client}/{tab?}', "ClientsController@show")
            ->name('clients.show')
            ->where('tab', 'statistics|shipments|pickups');

    }
}
