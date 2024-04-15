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
        Schema::create('establishment_product_options_groups_pivot', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('establishment_product_options_groups_id');

            $table->foreign('establishment_product_options_groups_id', 'fgroupd_establishment_product_options_groups_id')
            ->references('id')
            ->on('establishment_product_options_groups')
            ->onDelete('cascade');
            $table->unsignedBigInteger('establishment_product_id');
            $table->foreign('establishment_product_id', 'fgoup_establishment_product_id')
            ->references('id')
            ->on('establishment_product')
            ->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('establishment_product_options_groups_relation');
    }
};
