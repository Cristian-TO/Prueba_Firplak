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
        Schema::create('documento_entregas', function (Blueprint $table) {
            $table->id('id_documento');
            $table->foreignId('id_linea')->constrained('linea_pedidos')->cascadeOnDelete();
            $table->integer('numero_consecutivo');
            $table->date('fecha_despacho');
            $table->date('fecha_entrega')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('documento_entregas');
    }
};
