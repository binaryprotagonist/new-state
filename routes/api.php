<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::group([
    'namespace' => 'Api',
], function () {
    Route::group(['middleware' => ['api']], function () {
        // rutas publicas
        Route::post('/login', 'AuthController@login')->name('login.api');
        Route::post('/register', 'AuthController@register')->name('register.api');

        Route::group([
            'prefix' => 'password'
        ], function () {
            Route::post('create', 'PasswordResetController@create');
            Route::get('find/{token}', 'PasswordResetController@find');
            Route::post('reset', 'PasswordResetController@reset');
        });
    });

    Route::group(['middleware' => ['api', 'auth:api']], function () {
        //rutas autenticadas
        Route::post('/logout', 'AuthController@logout')->name('logout');

        Route::apiResource('entities', 'EntityController');
        Route::apiResource('services', 'ServiceController');
        Route::apiResource('referents', 'ReferentController');
        Route::get('referents/showbyuser/{id}', 'ReferentController@showByUser');
        Route::apiResource('roles', 'RoleController');
        Route::apiResource('expenses', 'ExpensesController');
        Route::apiResource('hours', 'HoursController');
        Route::post('chats/{chat}/messages', 'ChatController@addMessage');
        Route::get('chats/{chat}/messages', 'ChatController@getMessages');
        Route::apiResource('chats', 'ChatController');
        Route::get('permissions', 'RoleController@getPermissions');

        Route::group([
            'prefix' => 'patients/{patient}'
        ], function () {
            Route::post('/toggle', 'PatientController@toggleStatus');
            Route::post('/gallery', 'PatientController@storeGallery');

            Route::get('/pai', 'PAIController@show');
            Route::put('/pai', 'PAIController@update');

            Route::get('/invoices', 'PatientController@invoices');
            
        });

        Route::apiResource('patients', 'PatientController');

        Route::apiResource('patient_invoices', 'PatientInvoicesController');
        Route::apiResource('patient_budgets', 'PatientBudgetController');


        Route::apiResource('users', 'UserController');
        Route::get('user', 'UserController@getUser');

        Route::post('company/gallery', 'CompanyController@storeGallery');
        Route::post('company/delete/gallery/{id}', 'CompanyController@deleteGallery');
        Route::apiResource('company', 'CompanyController')->only(['index', 'store']);

        Route::post('providers/{provider}/toggle', 'ProviderController@toggleStatus');
        Route::post('providers/{provider}/gallery', 'ProviderController@storeGallery');
        Route::apiResource('providers', 'ProviderController');
        Route::apiResource('providers/{provider}/invoices', 'InvoiceController');

        Route::post('workers/{worker}/toggle', 'WorkerController@toggleStatus');
        Route::post('workers/{worker}/gallery', 'WorkerController@storeGallery');
        Route::apiResource('workers', 'WorkerController');

        Route::get('tasks/{task}/invoice', 'TaskController@invoice');
        Route::post('tasks/{task}/worker', 'TaskController@assignWorker');
        Route::post('tasks/{task}/gallery', 'TaskController@storeGallery');
        Route::post('tasks/{task}/expenses', 'TaskController@syncExpenses');
        Route::post('tasks/{task}/hours', 'TaskController@syncHours');
        Route::apiResource('tasks', 'TaskController');

    });
});
