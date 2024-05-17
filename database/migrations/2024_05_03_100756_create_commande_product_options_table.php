<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommandeProductOptionsTable extends Migration
{
    public function up()
    {
        Schema::create('commande_product_options', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('commande_product_id');
            $table->integer('establishment_product_options_groups_id');
            $table->integer('establishment_product_options_id');
            $table->decimal('option_price', 10, 2);
            $table->timestamp('created_at')->useCurrent();

            // Specify shorter name for foreign key constraint
            $table->foreign('commande_product_id', 'fk_commande_product_id')->references('id')->on('commande_products')->onDelete('cascade');
            $table->foreign('establishment_product_options_groups_id', 'fk_option_group')->references('id')->on('establishment_product_option_groups')->onDelete('cascade');
            $table->foreign('establishment_product_options_id', 'fk_option')->references('id')->on('establishment_product_options')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('commande_product_options');
    }
}
