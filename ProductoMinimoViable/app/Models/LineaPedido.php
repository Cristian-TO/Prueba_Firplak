<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LineaPedido extends Model
{
    use HasFactory;

    protected $fillable = ['SKU', 'Cantidad', 'FechaEntrega', 'TipoPedido', 'Bodega'];
    public function pedido()
    {
    return $this->belongsTo(Pedido::class);
    }
    public function documentoEntrega()
    {
    return $this->hasOne(DocumentoEntrega::class);
    }
   
}