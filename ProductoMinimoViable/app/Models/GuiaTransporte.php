<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GuiaTransporte extends Model
{
    use HasFactory;
    public function pruebasEntrega()
    {
        return $this->hasMany(PruebaEntrega::class, 'guia_transporte_id');
    }

    public function documentosEntrega()
    {
        return $this->hasMany(DocumentoEntrega::class, 'guia_transporte_id');
    }
}
