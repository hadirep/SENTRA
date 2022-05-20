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
        Schema::create('kesenians', function (Blueprint $table) {
            $table->string('id_kesenian')->length(20)->primary();
            $table->string('name');
            $table->integer('price')->nullable();
            $table->string('category')->nullable();
            $table->string('community')->nullable();
            $table->integer('phone_number')->nullable();
            $table->string('email')->nullable();
            $table->string('province')->nullable();
            $table->text('description')->nullable();
            $table->string('image')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('kesenians');
    }
};
