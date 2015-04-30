<?php namespace Ventamatic\Model\Place;

use Illuminate\Database\Eloquent\Model;

class Municipality extends Model {

    public function state(){
        return $this->belongsTo('Ventamatic\Model\Place\State');
    }
    
    public function localities(){
        return $this->hasMany('Ventamatic\Model\Place\Locality');
    }

}
