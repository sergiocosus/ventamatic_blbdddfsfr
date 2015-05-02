<?php namespace Ventamatic\Model;

use Illuminate\Database\Eloquent\Model;

class Buy extends Model {

    public function products()
    {
        return $this->belongsToMany('Ventamatic\Model\Product')
                ->withPivot(['quantity','cost']);
    }
    
    public function branch()
    {
        return $this->belongsTo('Ventamatic\Model\Branch');
    }
    
    public function user()
    {
        return $this->belongsTo('Ventamatic\User');
    }
    
    public function provider()
    {
        return $this->belongsTo('Ventamatic\Model\Provider');
    }

}
