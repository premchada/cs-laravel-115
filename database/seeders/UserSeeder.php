<?php

namespace Database\Seeders;

use Illuminate\Contracts\Pipeline\Hub;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use NunoMaduro\Collision\Adapters\Phpunit\State;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->delete();
        $data = [
            [
                'name' => 'Premvd',
                'email' => '622021115@tsu.ac.th',
                'password' => Hash::make('123456'),
                'role' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'chada',
                'email' => 'chada@gmail.com',
                'password' => Hash::make('123456'),
                'role' => 2,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            
        ];
        DB::table('users')->insert($data);
    }
}
