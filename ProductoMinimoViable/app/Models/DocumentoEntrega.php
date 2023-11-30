<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DocumentoEntrega extends Model
{
    use HasFactory;

    public function lineaPedido()
    {
        return $this->belongsTo(LineaPedido::class, 'linea_pedido_id');
    }

    public function guiaTransporte()
    {
        return $this->belongsTo(GuiaTransporte::class, 'guia_transporte_id');
    }

    public function factura()
    {
        return $this->hasOne(Factura::class, 'factura_id');
    }
}
