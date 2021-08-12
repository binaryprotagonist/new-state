<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('number'); // Invoice number / Loam Number
            $table->date('start_date')->nullable();
            $table->date('due_date');
            $table->string('base')->nullable();
            $table->string('total')->nullable();

            // Bank - state
            // $table->date('end_date')->nullable();
            // $table->string('total_import')->nullable();
            $table->string('interests')->nullable();

            //Provider
            // $table->date('invoice_date')->nullable();
            $table->string('iva_0')->nullable();
            $table->string('iva_4')->nullable();
            $table->string('iva_10')->nullable();
            $table->string('iva_21')->nullable();
            $table->string('irpf')->nullable();
            $table->string('invoice_type')->nullable();


            $table->unsignedBigInteger('provider_id');
            $table->foreign('provider_id')
                ->references('id')
                ->on('providers')
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
        Schema::dropIfExists('invoices');
    }
}
