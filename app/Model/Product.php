<?php namespace Ventamatic\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model {

    public function buys()
    {
        return $this->belongsToMany('Ventamatic\Model\Buy')
                ->withPivot(['quantity','cost']);
    }
    
    public function sales()
    {
        return $this->belongsToMany('Ventamatic\Model\Sale')
                ->withPivot(['quantity','price']);
    }
    
    public function branches()
    {
        return $this->belongsToMany('Ventamatic\Model\Branch')
                ->withPivot(['stock','price','cost']);
    }
    
    public function category(){
        return $this->belongsTo('Ventamatic\Model\Category');
    }
    

}
