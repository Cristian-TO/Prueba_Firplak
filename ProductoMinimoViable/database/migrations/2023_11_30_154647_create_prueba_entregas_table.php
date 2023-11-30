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
        Schema::create('prueba_entregas', function (Blueprint $table) {
            $table->id('id_PruebaEntrega');
            $table->foreignId('id_GuiaTransporte')->constrained('guia_transportes');
            $table->binary('FotoGuiaTransporte')->nullable(); 
            $table->binary('FotoDocumentoEntrega')->nullable(); 
            $table->text('Observaciones')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('prueba_entregas');
    }
};
