<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use App\Models\Task;
use App\Models\PatientInvoice;
use Carbon\Carbon;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = ['Laravel\Passport\Console\ClientCommand'];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->call(function () { // Send programmed outbound tasks
            //TODO @hcabello filtrar las task activas
            $tasks = Task::all();

            $now = now();
            foreach ($tasks as $task) {
                $dates = $task->dates;
                $this->checkPeriodicTasks($task, $now, $dates);
            }
        })->everyMinute();


        $schedule->call(function() {
           
           $tasks = Task::where('end_date', '>=', Carbon::now()->subMonth())->get();
           $sub_month = Carbon::now()->firstOfMonth()->subMonth();
           
           list($sub_date) = explode(' ', $sub_month);

           foreach($tasks as $task){
               $patient_invoice = [
                   'patient_id' => $task->patient_id,
                   'due_date' => $sub_date
               ];
               PatientInvoice::create($patient_invoice);
           }
            
        })->monthly();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }

    public function checkPeriodicTasks($task, $now, $dates)
    {
        $ends = false;
        //Check if the task should end
        switch ($dates['periodic']['frequency']['end']) {
            case 'date':
                $date = Carbon::parse($dates['periodic']['frequency']['end']['date']);
                $ends = $now->greaterThanOrEqualTo($date);
                break;
            case 'number':
                $times = 0; //TODO do something with ocurrences
                $ends = $times >= intval($dates['periodic']['frequency']['end']['number']);
                break;
            case 'never':
            default:
                break;
        }

        if ($ends) {
            return; // Stop the task execution and deactive
        }

        //Check if the task should send
        $sends = false;

        // TODO change update at por fecha de inicio
        $interval = intval($dates['periodic']['frequency']['number']);
        switch ($dates['periodic']['type']) {
            case 'days':
                $difference = $now->diffInDays($task->updated_at);
                $sends = $difference % $interval === 0 && $now->is($dates['time']);
                break;
            case 'weeks':
                $difference = $now->diffInWeeks($task->updated_at);
                $sends = $difference % $interval === 0 && $now->is($dates['time']) && $now->isDayOfWeek(intval($dates['periodic']['frequency']['day_of_week']));
                break;
            case 'months':
                $difference = $now->diffInMonths($task->updated_at);
                $sends = $difference % $interval === 0 && $now->is($dates['time']) && $now->day === intval(intval($dates['periodic']['frequency']['day_of_month']));
                break;
            case 'years':
                $difference = $now->diffInYears($task->updated_at);
                $sends = $difference % $interval === 0 && $now->is($dates['time']) && $now->isSameAs('m-d', Carbon::parse($dates['periodic']['frequency']['day_of_year']));
                break;
        }


        if ($sends) { // Dispatch if the conditions pass
            //Hacer algo
        }
    }
}
