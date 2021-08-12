<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProvidersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('providers', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->enum('type', ['bank', 'provider', 'state']);
            $table->boolean('active')->default(true);
            //General
            $table->string('name');
            $table->string('cif');
            $table->string('phone');
            $table->string('mobile')->nullable(); // Optional
            $table->string('address');
            $table->string('cp');
            $table->string('population');
            $table->string('email');
            $table->string('contact_person');

            //Provider
            $table->enum('payment_method', ['cash', 'transfer', 'bank'])->nullable();
            $table->string('entity')->nullable();
            $table->string('iban')->nullable();
            $table->string('bic')->nullable();



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
        Schema::dropIfExists('providers');
    }
}
