<?php namespace Ventamatic\Model;

use Illuminate\Database\Eloquent\Model;

class Branch extends Model {

    public function products()
    {
        return $this->belongsToMany('Ventamatic\Model\Product')
                ->withPivot(['stock','price','cost']);
    }
    
    public function users()
    {
        return $this->belongsToMany('Ventamatic\Model\User');
    }
    
    public function sales()
    {
        return $this->hasMany('Ventamatic\Model\Sale');
    }
    
    public function buys()
    {
        return $this->hasMany('Ventamatic\Model\Buys');
    }
    
    public function innings()
    {
        return $this->hasMany('Ventamatic\Model\Inning');
    }
}