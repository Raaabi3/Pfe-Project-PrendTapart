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
        Schema::create('establishment_product_options_groups', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->integer('maximun_choose')->default(0);
            $table->string('type');
            $table->unsignedBigInteger('establishment_id');

            $table->foreign('establishment_id', 'fgroup_establishment_id')
            ->references('id')
            ->on('establishments')
            ->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('establishment_product_options_groups');
    }
};
