<?php

use Illuminate\Database\Seeder;
use App\Models\User;
use Spatie\Permission\Models\Role;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'name' => env('SATE_ADMIN_USER_NAME'),
            'email' => env('SATE_ADMIN_USER_EMAIL'),
            'password' => Hash::make(env('SATE_ADMIN_USER_PASSWORD')),
        ]);

        Artisan::call('passport:client --name=admin --no-interaction --personal');
    }
}
