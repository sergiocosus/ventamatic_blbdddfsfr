<?php namespace Ventamatic\Model\Place;

use Illuminate\Database\Eloquent\Model;

class Locality extends Model {

    public function state(){
        return $this->belongsTo('Ventamatic\Model\Place\State');
    }
    
    public function municipality(){
        return $this->belongsTo('Ventamatic\Model\Place\Municipality');
    }


}
