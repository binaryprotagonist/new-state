<?php

namespace App\Http\Controllers\Api;

use App\Models\Referent;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Entity;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class ReferentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Referent::with('user')->get();
    }

    protected function validateInput($request, $referent = null)
    {
        return $request->validate([
            'name' => 'required|string',
            'email' => [
                'required',
                is_null($referent) ? 'unique:users,email' : Rule::unique('users')->ignore($referent->user)
            ],
            'password' => [
                is_null($referent) ? 'required' : 'nullable'
            ],
            'cp' => 'required',
            'population' => 'required',
            'province' => 'required',
            'address' => 'required',
            'phone' => 'required',
            'entity_id' => 'exists:entities,id',
            'role_id' => 'required|exists:roles,id',
            'dni' => 'required',
            'entity' => '',
            'grau_de_parentiu' => ''
        ]);
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

        if($validated['role_id'] == 7){
            $entity = Entity::create($validated['entity']);
            $validated['entity_id'] = $entity->id;
            
        }

        unset($validated['entity']);

        $validated['password'] = Hash::make($validated['password']);
        $user = User::create(array_only($validated, ['name', 'email', 'password']));
        $referent = Referent::create(array_except($validated, ['name', 'email', 'password','role_id']));

        $user->syncRoles($validated['role_id']);

        $referent->user()->save($user);

        return $referent->loadMissing(['user','entity']);
    }

    public function showByUser(Request $request)
    {
        $user = User::find($request->id);
        $user->workable->load("entity");

        return $user->workable;
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Referent  $referent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Referent $referent)
    {
        $validated = $this->validateInput($request, $referent);

        if($validated['role_id'] == 7){
            $referent->entity->update($validated['entity']);
        }
        unset($validated['entity']);


        if (array_key_exists('password', $validated)) {
            $validated['password'] = Hash::make($validated['password']);
        }
        $referent->user->update(array_only($validated, ['name', 'email', 'password']));
        $referent->update(array_except($validated, ['name', 'email', 'password','role_id']));

        $referent->user->syncRoles($validated['role_id']);

        return $referent->load(['user','entity']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Referent  $referent
     * @return \Illuminate\Http\Response
     */
    public function destroy(Referent $referent)
    {
        $referent->user->delete();
        $referent->delete();
        return response()->json(['msg' => 'Eliminado con éxito']);
    }
}
