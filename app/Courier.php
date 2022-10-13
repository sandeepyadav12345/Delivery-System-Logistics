<?php

namespace App;

use App\Interfaces\Accountable;
use App\Traits\CourierAccounting;
use App\Traits\HasAttachmentsTrait;
use App\Traits\PrepareAccounting;
use App\Traits\StatisticsTrait;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;

/**
 * @property int id
 * @property string name
 * @property string password
 * @property string phone_number
 * @property string address
 * @property integer category
 * @property string notes
 * @property Collection[Attachment] attachments
 * @property User user
 * @property string email
 *
 * @method static self createdToday()
 * @method static self haveWorkToday()
 *
 * @mixin Builder
 */
class Courier extends Model implements Accountable
{
    use SoftDeletes, HasAttachmentsTrait;
    use PrepareAccounting, CourierAccounting, StatisticsTrait;

    protected $dates = ['deleted_at'];

    protected $folderToUpload = "couriers";

    protected $fillable = [
        'name',
        'email',
        'password' .
        'phone_number',
        'address',
        'category',
        'notes',
    ];

    protected static function boot()
    {
        parent::boot();

        static::deleting(function(self $instance) {
            $instance->user->delete();
        });
    }

    public function scopeHaveSmiley($query)
    {
        $thirtyDaysBefore        = date("d-m-Y", strtotime("- 30 days"));
        $ShipmentsCountForSmiley = intval(Setting::get("promotion_requirement")->value) ?? 30;

        return $query->leftJoin('shipments', 'couriers.id', '=', 'shipments.courier_id')
            ->where('shipments.delivery_date', ">", $thirtyDaysBefore)
            ->groupBy('shipments.id')->havingRaw("count(`shipments`.`id`) > $ShipmentsCountForSmiley");
    }

    public function scopeCreatedToday(Builder $builder)
    {
        return $builder->whereDate('created_at', ">", now()->startOfDay());
    }


    public function zones()
    {
        return $this->belongsToMany(Zone::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany|Shipment
     */
    public function shipments()
    {
        return $this->hasMany(Shipment::class);
    }

    public function pickups()
    {
        return $this->hasMany(Pickup::class);
    }

    public function user()
    {
        return $this->hasOne(User::class, 'identifier', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany|Invoice
     */
    public function invoices()
    {
        return $this->hasMany(Invoice::class, 'target', 'id');
    }

    public function scopeHaveWorkToday(Builder $builder)
    {
        return $builder->whereExists(function (\Illuminate\Database\Query\Builder $query) {
            $query->select(DB::raw(1))
                ->from('shipments')
                ->whereColumn('shipments.courier_id', '=', 'couriers.id')
                ->whereDate('shipments.delivery_date', '<=', now()->endOfDay())
                ->whereNotIn('status_id', Status::name(['delivered', 'collected'])->pluck('id'))
                ->orWhere('courier_cashed', false);
        })->whereExists(function (\Illuminate\Database\Query\Builder $query) {
            $query->select(DB::raw(1))
                ->from('invoices')
                ->whereColumn('invoices.target', '=', 'couriers.id')
                ->where('invoices.type', '=', 'courier');
        }, "or")->select('couriers.*');
    }

    public function isOpenAccount()
    {
        return $this->shipments()->whereDate('delivery_date', "<=", now()->endOfDay())->courierCashed(false)->exists();
    }

    public function createUser()
    {
        if (!is_null($this->user)) return $this->user;

        $user_template = UserTemplate::where('name', 'courier')->first();
        if (is_null($user_template)) UserTemplate::default()->first();

        $user           = new User;
        $user->username = str_pad($this->id, 4, "0", STR_PAD_LEFT);
        $user->email    = $this->email;
        $user->password = Hash::make($this->password);
        $user->template()->associate($user_template);
        $user->courier()->associate($this);
        $user->save();

        return $user;
    }

    public static function routes()
    {
        Route::resource('couriers', "CouriersController");
        Route::get('couriers/{courier}/shipments', "CouriersController@inventory")->name("couriers.inventory");
    }

    public function identifiableName()
    {
        return $this->name;
    }
}
