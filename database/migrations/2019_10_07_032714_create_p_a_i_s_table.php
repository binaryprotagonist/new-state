<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePAISTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('p_a_i_s', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('background')->nullable();
            $table->string('diabetes')->nullable();
            $table->string('hypertension')->nullable();
            $table->string('surgical_interventions')->nullable();
            $table->string('diagnostics')->nullable();
            $table->string('allergies')->nullable();
            $table->string('treatment')->nullable();
            $table->string('medication')->nullable();
            $table->string('can_express')->nullable();
            $table->string('medication_complimentary')->nullable();

            $table->string('diet')->nullable();
            $table->string('toxics')->nullable();
            $table->string('exercise')->nullable();

            $table->string('care_aspect')->nullable();
            $table->string('hygiene')->nullable();

            $table->string('roaming')->nullable();
            $table->string('support')->nullable();

            $table->string('recognizes')->nullable();
            $table->string('daily_hygiene')->nullable();
            $table->string('dress_up')->nullable();
            $table->string('bathroom')->nullable();
            $table->string('food')->nullable();

            $table->string('buy')->nullable();
            $table->string('cook')->nullable();
            $table->string('clean_up')->nullable();
            $table->string('new_tech')->nullable();

            $table->string('hobbies')->nullable();
            $table->string('religious')->nullable();
            $table->string('interests')->nullable();

            $table->string('orientation')->nullable();
            $table->string('short')->nullable();
            $table->string('long')->nullable();
            $table->string('storm')->nullable();
            $table->string('recognizes_friends')->nullable();
            $table->string('self_concept')->nullable();
            $table->string('language')->nullable();
            $table->string('compression')->nullable();
            $table->string('behavior')->nullable();
            $table->string('delusions')->nullable();
            $table->string('hallucinations')->nullable();

            $table->string('mood')->nullable();
            $table->string('shows_emotions')->nullable();
            $table->string('manage_emotions')->nullable();
            $table->string('manage_issues')->nullable();
            $table->string('curiosity')->nullable();
            $table->string('somatic')->nullable();

            $table->string('social_relations')->nullable();
            $table->string('family')->nullable();
            $table->string('activities')->nullable();
            $table->string('transportation')->nullable();
            $table->string('inappropriate')->nullable();
            $table->string('aggressiveness')->nullable();

            $table->string('spare_time')->nullable();
            $table->string('personal_satisfaction')->nullable();
            $table->string('schedules')->nullable();
            $table->string('alternative_activities')->nullable();
            $table->string('autonomous')->nullable();
            $table->string('goals')->nullable();
            $table->string('objects')->nullable();

            $table->string('provision')->nullable();

            $table->string('to_work')->nullable();

            $table->string('follow_up')->nullable();

            $table->string('observation')->nullable();

            $table->unsignedBigInteger('patient_id');

            $table->foreign('patient_id')
            ->references('id')
            ->on('patients')
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
        Schema::dropIfExists('p_a_i_s');
    }
}
