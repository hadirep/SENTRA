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
        Schema::table('kesenians', function($table) {
            $table->string('is_facebook')->nullable();
            $table->string('is_instagram')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('kesenians', function($table) {
            $table->dropColumn('is_facebook')->nullable();
            $table->dropColumn('is_instagram')->nullable();
        });
    }
};
