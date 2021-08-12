<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePatientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('patients', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('last_name');
            $table->longText('description')->nullable();
            $table->boolean('active')->default(true);
            $table->string('dni');
            $table->string('tis');
            $table->enum('situation', ['tutela','curatela','no tutela']);
            $table->enum('residence', ["Domicili Particular", "Domicili Institucio"]);
            $table->date('birth_date');

            $table->string('bank');
            $table->string('iban');
            $table->string('bic');

            $table->string('reason')->nullable();

            $table->unsignedBigInteger('referent_economic_guardianship_id');
            $table->unsignedBigInteger('referent_social_guardianship_id');
            $table->unsignedBigInteger('referent_economic_residence_id')->nullable();
            $table->unsignedBigInteger('referent_social_residence_id')->nullable();

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
        Schema::dropIfExists('patients');
    }
}
