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
        Schema::create('guia_transportes', function (Blueprint $table) {
            $table->id('id_GuiaTransporte');
            $table->foreignId('id_documento')->constrained('documento_entregas')->cascadeOnDelete();
            $table->integer('id_Cliente')->nullable();
            $table->integer('id_Ubicacion')->nullable();
            $table->date('fecha_despacho')->nullable();
            $table->enum('EstadoGuia', ['Pendiente', 'EnProceso', 'Entregado'])->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('guia_transportes');
    }
};
