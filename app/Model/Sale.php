<?php namespace Ventamatic\Model;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model {

    public function products()
    {
        return $this->belongsToMany('Ventamatic\Model\Product')
                ->withPivot(['quantity','price']);
    }

    public function branch()
    {
        return $this->belongsTo('Ventamatic\Model\Branch');
    }
    
    public function user()
    {
        return $this->belongsTo('Ventamatic\User');
    }
    
    public function client()
    {
        return $this->belongsTo('Ventamatic\Model\Client');
    }
}
