<?php namespace Ventamatic\Model;

use Illuminate\Database\Eloquent\Model;

class Client extends Model {

    public function buys()
    {
        return $this->hasMany('Ventamatic\Model\Buy');
    }

}
