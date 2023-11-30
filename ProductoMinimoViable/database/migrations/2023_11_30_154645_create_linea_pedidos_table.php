<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('linea_pedidos', function (Blueprint $table) {
            $table->id('id_linea');
            $table->foreignId('id_pedidos')->constrained('pedidos')->cascadeOnDelete();
            $table->String('sku_producto');
            $table->integer('cantidad');
            $table->date('fecha_entrega');
            $table->enum('tipo_pedido', ['MTO', 'MTS']);
            $table->String('bodega')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('linea_pedidos');
    }
};
