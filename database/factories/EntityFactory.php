<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Entity;
use Faker\Generator as Faker;

$factory->define(Entity::class, function (Faker $faker) {
    return [
        'name' => $faker->unique()->name,
        'cif' => $faker->randomNumber(9),
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
