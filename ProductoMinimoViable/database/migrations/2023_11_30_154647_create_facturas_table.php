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
        Schema::create('facturas', function (Blueprint $table) {
            $table->id('id_Factura');
            $table->foreignId('id_Documento')->constrained('documento_entregas')->cascadeOnDelete();
            $table->date('fechaFacturacion')->nullable();
            $table->enum('MetodoEnvio', ['CorreoElectronico', 'Fisico']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('facturas');
    }
};
