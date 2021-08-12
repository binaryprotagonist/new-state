<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Chat;

class ChatController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:crud chats')->except(['show','index','getMessages','addMessage','store']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->user()->hasRole('Administracio')){
            return Chat::all();
        }else {
            $roles = $request->user()->roles->pluck('name')->join(',');
           $chats = Chat::where('roles','LIKE', '%' . $roles . '%')->get();
           $chats =  $chats->filter(function($chat) use ($roles) {
            return collect($chat->roles)->some(function($role) use ($roles) {
                if(strpos($role['name'], $roles) !== false) return true;
                return false;
            });
           });
           return $chats->values()->all();
        }
    }

    protected function validateInput($request, $role = null)
    {
        return $request->validate([
            'name' => [
                'required',
            ],
            'roles' => ['required'],
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

        $chat = Chat::create($validated);

        return $chat;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Chat  $chat
     * @return \Illuminate\Http\Response
     */
    public function show(Chat $chat)
    {
        return $chat;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Chat  $chat
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Chat $chat)
    {
        $validated = $this->validateInput($request);

        $chat->update($validated);

        return $chat;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Chat  $chat
     * @return \Illuminate\Http\Response
     */
    public function destroy(Chat $chat)
    {
        $chat->delete();
        return response()->json(['msg' => 'Eliminado con éxito']);
    }

    public function getMessages(Request $request, Chat $chat){
        return $chat->messages->load('user');
    }

    public function addMessage(Request $request, Chat $chat){
        $message = $chat->messages()->create([
            'text' => $request->message,
            'user_id' => $request->user()->id,
        ]);
        return $message;
    }
}
