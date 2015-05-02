<?php namespace Ventamatic\Model;

use Illuminate\Database\Eloquent\Model;

class Category extends Model {

    public function products()
    {
        return $this->hasMany('Ventamatic\Model\Product');
    }

}
