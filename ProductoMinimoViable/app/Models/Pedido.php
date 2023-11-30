<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    use HasFactory;
    protected $fillable = ['Consecutivo', 'FechaPedido'];

    public function lineasPedido()
    {
    return $this->hasMany(LineaPedido::class);
    }
}
