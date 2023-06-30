<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class prestatieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            'name' => 'admin',
            'email' => 'admin@admin.nl',
            'password' => bcrypt('Password'),
        ]);
        DB::table('prestaties')->insert([
            'oefening_id' => '1',
            'amount' => '10',
            'date' => Carbon::now()->toDateString(),
            'time' => "00:30",
            'user_id'=> '1',
        ]);
    }
}
