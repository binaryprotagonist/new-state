<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([AdminSeeder::class,RolesAndPermissionSeeder::class]);

        $roles = [
            ["text" => 'Administracio', 'type' => null],
            ["text" => 'Treballador', 'type' => "treballador"],
            ["text" => 'Coordinacio', 'type' => "treballador"],
            ["text" => 'Facturacio', 'type' => "treballador"],
            ["text" => 'Referent social', 'type' => "referent"],
            ["text" => 'Referent economic', 'type' => "referent"],
            ["text" => 'Particular', 'type' => "referent"],
        ];

        factory(App\Models\Entity::class, 5)->create();

        factory(App\Models\Referent::class, 25)->create()->each(function ($referent) use ($roles) {
            $referent->user()->save(factory(App\Models\User::class)->create());
            $referent->user->syncRoles($roles[rand(2, 4)]['text']);
        });

        factory(App\Models\Patient::class, 20)->create();
    }
}
