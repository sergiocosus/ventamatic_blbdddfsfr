<?php namespace Ventamatic\model;

use Illuminate\Database\Eloquent\Model;

class Inning extends Model {

    public function user()
    {
        return $this->belongsTo('Ventamatic\Model\User');
    }
    
    public function branch()
    {
        return $this->belongsTo('Ventamatic\Model\Branch');
    }

}
