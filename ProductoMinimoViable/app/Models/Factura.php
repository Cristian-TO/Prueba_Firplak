<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Factura extends Model
{
    use HasFactory;

    public function documentoEntrega()
    {
        return $this->belongsTo(DocumentoEntrega::class, 'documento_entrega_id');
    }
}

