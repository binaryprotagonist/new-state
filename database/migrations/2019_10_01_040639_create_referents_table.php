<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReferentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('referents', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('cp');
            $table->string('population');
            $table->string('province');
            $table->string('address');
            $table->string('phone');

            $table->unsignedBigInteger('entity_id');
            $table->foreign('entity_id')
            ->references('id')
            ->on('entities')
            ->onDelete('cascade');

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
        Schema::dropIfExists('referents');
    }
}
