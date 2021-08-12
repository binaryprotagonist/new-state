<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/test/{id}', 'Api\PatientController@test'); 
Route::get('/patients/{patient}/contract', 'Api\PatientController@contract');

Route::get('/patients/{patient}/annexes', 'Api\PatientController@annexes');

Route::get('/patients/{patient}/contract', 'Api\PatientController@contract');
Route::get('/patients/{patient}/{patient_invoice}/invoice', 'Api\PatientController@invoice');
Route::get('/patients/{patient}/pai/contract', 'Api\PAIController@contract');
Route::get('/patient_invoices/{patient_invoice}/pdf', 'Api\PatientInvoicesController@pdf');
Route::get('/patient_budgets/{patient_invoice}/pdf', 'Api\PatientBudgetController@pdf');
Route::post('tasks/finish/{id}', 'Api\TaskController@finishTask');
Route::get('tasks/{task}/invoice', 'Api\TaskController@invoice');
Route::get('tasks/{task}/invoice/excel', 'Api\TaskController@invoiceExcel');
Route::get('/worker/hours/export', 'Api\WorkerController@workerInvoiceExcel');
Route::get('/invoice/excel/export', 'Api\PatientInvoicesController@invoiceExcelExport');

Route::get('setup/link', function () {
    Artisan::call('storage:link');
});
Route::get('setup/migrate', function () {
    Artisan::call('migrate:fresh');
    Artisan::call('db:seed');
    Artisan::call('passport:install');
    echo 'Migrado con exito';
});

Route::get('/{any}', function () {
    return view('index');
})->where('any', '.*');