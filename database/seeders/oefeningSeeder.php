<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class oefeningSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('oefening')->insert([
            'name' => 'Squat',
            'name_nl' => 'Squat',
            'description' => '',
            'description_nl' => 'Squat is een kniebuiging. Je oefent hiermee je hamstrings, heupen, quadriceps en bilspieren.',
            'explanation' => '',
            'explanation_nl' => '
            1.	Sta rechtop.
            2.	Houd je armen op de hoogte van je schouders.
            3.	Zak je benen langzaam.
            4.	Zorg dat je knieën een hoek hebben van 90 graden.
            5.	Ga weer langzaam omhoog.
            Herhaal dit 5 keer en veel succes met de oefening.
            ',
            'GIF' => 'Squat.gif'
        ]);
        DB::table('oefening')->insert([
            'name' => 'Squat',
            'name_nl' => 'Push-up',
            'description' => '',
            'description_nl' => '',
            'explanation' => '',
            'explanation_nl' => '',
            'GIF' => 'Squat.gif'
        ]);
    }
}
