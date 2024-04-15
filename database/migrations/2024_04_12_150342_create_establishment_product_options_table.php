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
        Schema::create('establishment_product_options', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('price');
            $table->unsignedBigInteger('establishment_product_options_groups_id');

            $table->foreign('establishment_product_options_groups_id', 'foptions_establishment_product_options_groups_id')
            ->references('id')
            ->on('establishment_product_options_groups')
            ->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('establishment_product_options');
    }
};
