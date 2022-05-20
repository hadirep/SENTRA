<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('images_kesenians', function (Blueprint $table) {
            $table->id();
            $table->string('id_kesenian_img')->length(20);
            $table->string('documentation')->nullable();
            $table->timestamps();
        });

        Schema::table('images_kesenians', function($table)
        {
            $table->foreign('id_kesenian_img')->references('id_kesenian')->on('kesenians');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('images_kesenians');
    }
};
