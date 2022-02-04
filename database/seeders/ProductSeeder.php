<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeeder extends Seeder
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
                'product_name' => 'iPhone 14',
                'product_type' => 1,
                'price' => '39990',
                'created_at' => Carbon::now(),
                'created_at' => Carbon::now(),
            ],
            [
                'product_name' => 'Galaxy S20',
                'product_type' => 1,
                'price' => '25900',
                'created_at' => Carbon::now(),
                'created_at' => Carbon::now(),
            ],
            [
                'product_name' => 'LG Smart TV',
                'product_type' => 2,
                'price' => '30900',
                'created_at' => Carbon::now(),
                'created_at' => Carbon::now(),
            ],
            [
                'product_name' => 'Samsung Smart TV',
                'product_type' => 2,
                'price' => '40900',
                'created_at' => Carbon::now(),
                'created_at' => Carbon::now(),
            ],
            
        ];
        DB::table('products')->insert($data);
    }
}
