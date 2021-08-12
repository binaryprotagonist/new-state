<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Patient;
use Faker\Generator as Faker;

$factory->define(Patient::class, function (Faker $faker) {
    $randomId = App\Models\Entity::get()->random()->referents->random()->id;
    $randomId1 = App\Models\Entity::get()->random()->referents->random()->id;
    return [
        'name' => $faker->firstName(),
        'last_name' => $faker->lastName,
        'active' => $faker->boolean(),
        'dni' => $faker->randomNumber(8),
        'tis' => $faker->randomNumber(5),
        'situation' => ['tutela','curatela','no tutela'][rand(0, 2)],
        'residence' => ['Domicili Particular', 'Domicili Institucio'][rand(0, 1)],
        'birth_date' => $faker->date(),
        'bank' => $faker->bankAccountNumber,
        'iban' => $faker->bankAccountNumber,
        'bic' => $faker->bankAccountNumber,
        'referent_economic_guardianship_id' => $randomId,
        'referent_social_guardianship_id' => $randomId,
        'referent_economic_residence_id' => $randomId1,
        'referent_social_residence_id' => $randomId1,
    ];
});
