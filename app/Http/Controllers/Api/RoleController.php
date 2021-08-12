<?php

namespace App\Http\Controllers\Api;

use Spatie\Permission\Models\Role;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Permission;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:crud roles')->except(['index','getPermissions']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->has('type')) {
            $roles = Role::whereShow($request->get('type'))->get();
        } else {
            $roles = Role::all();
        }
        return $roles->each(function ($role) {
            $permissions =  $role->permissions;
            return $role->permission = $permissions->pluck('name');
        });
    }

    protected function validateInput($request, $role = null)
    {
        return $request->validate([
            'name' => [
                'required',
                is_null($role) ? 'unique:roles,name' : Rule::unique('roles')->ignore($role)
            ],
            'show' => [
                Rule::in(['treballador','referent',null]),
            ],
            'permission' => ['exists:permissions,name'],
        ]);
    }

    public function getPermissions()
    {
        return $permissions = Permission::all()->groupBy(function ($item, $key) {
            return explode(' ',$item['name'])[1];
        });

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $this->validateInput($request);

        $role = Role::create(array_except($validated, 'permission'));
        $role->syncPermissions($validated['permission']);

        $permissions =  $role->permissions;
        $role->permission = $permissions->pluck('name');
        return $role->loadMissing('permissions');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Spatie\Permission\Models\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Role $role)
    {
        $validated = $this->validateInput($request, $role);

        $role->update(array_except($validated, 'permission'));
        $role->syncPermissions($validated['permission']);

        $permissions =  $role->permissions;
        $role->permission = $permissions->pluck('name');
        return $role->load(['permissions']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Spatie\Permission\Models\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy(Role $role)
    {
        $role->delete();
        return response()->json(['msg' => 'Eliminado con éxito']);
    }
}
