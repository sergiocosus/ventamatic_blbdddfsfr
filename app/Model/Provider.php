<?php namespace Ventamatic\Model;

use Illuminate\Database\Eloquent\Model;

class Provider extends Model {

    public function sales()
    {
        return $this->hasMany('Ventamatic\Model\Sale');
    }

}
