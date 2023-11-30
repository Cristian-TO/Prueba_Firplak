<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PruebaEntrega extends Model
{
    use HasFactory;
    public function guiaTransporte()
    {
        return $this->belongsTo(GuiaTransporte::class, 'guia_transporte_id');
    }
}
