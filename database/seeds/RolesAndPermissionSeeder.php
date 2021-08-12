<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesAndPermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles = [
            ["text" => 'Administracio', 'type' => null],
            ["text" => 'Treballador', 'type' => "treballador"],
            ["text" => 'Coordinacio', 'type' => "treballador"],
            ["text" => 'Facturacio', 'type' => "treballador"],
            ["text" => 'Referent social', 'type' => "referent"],
            ["text" => 'Referent economic', 'type' => "referent"],
            ["text" => 'Particular', 'type' => "referent"],
        ];

        foreach ($roles as $role) {
            // Crear Roles
            Role::create(['guard_name' => 'api','name' => $role['text'], 'show' => $role['type']]);
        }

        $permissions = [
            'read entities','crud entities',
            'read roles','crud roles',
            'read providers','crud providers',
            'read tasks','crud tasks',
            'read patients','crud patients',
            'read referents','crud referents',
            'read workers','crud workers',
            'read patient_invoices','crud patient_invoices',
        ];

        $user = App\Models\User::first();

        $user->assignRole('Administracio');

        foreach ($permissions as $permission) {
            Permission::create(['guard_name' => 'api','name' => $permission]);
        }

        // $admin = Role::where('name', 'admin')->first();

        // $admin->syncPermissions($permissions);
    }
}
