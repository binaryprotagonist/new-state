<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Entity;
use App\Models\Referent;
use Faker\Generator as Faker;

$factory->define(Referent::class, function (Faker $faker) {
    return [
        'cp' => $faker->postcode,
        'population' => $faker->city,
        'province' => $faker->country,
        'address' => $faker->address,
        'phone' => $faker->phoneNumber,
        'entity_id' => App\Models\Entity::get()->random()->id
    ];
});
