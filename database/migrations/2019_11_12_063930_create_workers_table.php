<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('workers', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onDelete('cascade');

            // $table->string('name'); In user
            $table->string('last_name');
            $table->string('dni');
            $table->boolean('active')->default(true);
            $table->string('address');
            $table->string('cp');
            $table->string('population');
            $table->string('phone');
            $table->string('mobile')->nullable();
            // $table->string('email'); In user
            $table->date('birth_date');
            $table->string('company_email');

            $table->string('banking_entity');
            $table->string('iban');
            $table->string('bic');
            $table->text('academic_training')->nullable(); //json
            $table->text('work_experience')->nullable(); //json

            $table->string('type_of_contract');
            $table->string('working_day');
            $table->date('initial_date');
            $table->date('renewal_date');
            $table->string('contract_duration');
            $table->string('category');

            $table->string('import');
            $table->string('irpf');
            $table->string('total_import');

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
        Schema::dropIfExists('workers');
    }
}
