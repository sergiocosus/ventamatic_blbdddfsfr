<?php namespace Ventamatic\Model\Place;

use Illuminate\Database\Eloquent\Model;

class State extends Model {

    public function municipalities(){
        return $this->hasMany('Ventamatic\Model\Place\Municipality');
    }

}
