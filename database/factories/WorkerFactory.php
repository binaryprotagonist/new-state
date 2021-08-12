<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Worker;
use Faker\Generator as Faker;

$factory->define(Worker::class, function (Faker $faker) {
    return [
        "email" => '',
        "password" => '',
        "last_name" => '',
        "dni" => '',
        "population" => '',
        "phone" => '',
        "mobile" => '',
        "birth_date" => '',
        "company_email" => '',
        "banking_entity" => '',
        "academic_training" => '',
        "work_experience" => '',
        "type_of_contract" => '',
        "working_day" => '',
        "initial_date" => '',
        "renewal_date" => '',
        "contract_duration" => '',
        "category" => '',
        "import" => '',
        "irpf" => '',
        "total_import" => '',
        "role_id" => '',


        'name' => $faker->unique()->name,
        'population' => $faker->city,
        'cp' => $faker->randomNumber(5),
        'province' => $faker->country,
        'address' => $faker->address,
        'phone' => $faker->phoneNumber,
        'bank' => $faker->monthName(),
        'iban' => $faker->bankAccountNumber,
        'bic' => $faker->bankAccountNumber,
        'type' => ['residencia','tutela'][rand(0,1)],
    ];
});
