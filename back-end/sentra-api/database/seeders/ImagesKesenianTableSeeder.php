<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ImagesKesenianTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $posts = [
            [
                'id_kesenian_img' => 'STR2205026',
                'documentation' => 'debus1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205026',
                'documentation' => 'debus2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205026',
                'documentation' => 'debus3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205029',
                'documentation' => 'pencaksilat1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205029',
                'documentation' => 'pencaksilat2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205029',
                'documentation' => 'pencaksilat3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205030',
                'documentation' => '.pertunjukkanangklung1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205030',
                'documentation' => '.pertunjukkanangklung2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205030',
                'documentation' => '.pertunjukkanangklung3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205006',
                'documentation' => 'taribendana1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205006',
                'documentation' => 'taribendana2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205006',
                'documentation' => 'taribendana3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205011',
                'documentation' => 'taricerana1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205011',
                'documentation' => 'taricerana2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205011',
                'documentation' => 'taricerana3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205019',
                'documentation' => 'taricampak1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205019',
                'documentation' => 'taricampak2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205019',
                'documentation' => 'taricampak3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205007',
                'documentation' => 'tarigambyong1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205007',
                'documentation' => 'tarigambyong2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205007',
                'documentation' => 'tarigambyong3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205023',
                'documentation' => 'tarigandrung1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205023',
                'documentation' => 'tarigandrung2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205023',
                'documentation' => 'tarigandrung3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205015',
                'documentation' => 'tarigantar1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205015',
                'documentation' => 'tarigantar2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205015',
                'documentation' => 'tarigantar3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205017',
                'documentation' => 'tarigendingsriwijaya1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205017',
                'documentation' => 'tarigendingsriwijaya2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205017',
                'documentation' => 'tarigendingsriwijaya3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205022',
                'documentation' => 'tarigiringgiring1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205022',
                'documentation' => 'tarigiringgiring2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205022',
                'documentation' => 'tarigiringgiring3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205005',
                'documentation' => 'tarijaipong2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205005',
                'documentation' => 'tarijaipong3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205005',
                'documentation' => '',
            ],
            [
                'id_kesenian_img' => 'STR2205001',
                'documentation' => 'tarikecak1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205001',
                'documentation' => 'tarikecak2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205001',
                'documentation' => 'tarikecak3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205013',
                'documentation' => 'tarikipaspakarena1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205013',
                'documentation' => 'tarikipaspakarena2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205013',
                'documentation' => 'tarikipaspakarena3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205024',
                'documentation' => 'tarimaengket1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205024',
                'documentation' => 'tarimaengket2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205024',
                'documentation' => 'tarimaengket3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205025',
                'documentation' => 'tarimance1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205025',
                'documentation' => 'tarimance2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205025',
                'documentation' => 'tarimance3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205002',
                'documentation' => 'tarimusyoh1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205002',
                'documentation' => 'tarimusyoh2.webp',
            ],
            [
                'id_kesenian_img' => 'STR2205002',
                'documentation' => 'tarimusyoh3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205016',
                'documentation' => 'tariondelondel1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205016',
                'documentation' => 'tariondelondel2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205016',
                'documentation' => 'tariondelondel3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205018',
                'documentation' => 'taripedangmualang1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205018',
                'documentation' => 'taripedangmualang1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205018',
                'documentation' => 'taripedangmualang1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205014',
                'documentation' => 'taripiring1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205014',
                'documentation' => 'taripiring2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205014',
                'documentation' => 'taripiring3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205004',
                'documentation' => 'tarireogponorogo1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205004',
                'documentation' => 'tarireogponorogo2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205004',
                'documentation' => 'tarireogponorogo3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205003',
                'documentation' => 'tarisaman1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205003',
                'documentation' => 'tarisaman2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205003',
                'documentation' => 'tarisaman3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205009',
                'documentation' => 'tariserimpi2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205008',
                'documentation' => 'taritopeng1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205008',
                'documentation' => 'taritopeng2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205008',
                'documentation' => 'taritopeng3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205021',
                'documentation' => 'taritopengbanjar1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205021',
                'documentation' => 'taritopengbanjar2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205021',
                'documentation' => 'taritopengbanjar3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205012',
                'documentation' => 'taritortor1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205012',
                'documentation' => 'taritortor2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205012',
                'documentation' => 'taritortor3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205020',
                'documentation' => 'tariyerik1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205020',
                'documentation' => 'tariyerik2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205020',
                'documentation' => 'tariyerik3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205010',
                'documentation' => 'tarizipin1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205010',
                'documentation' => 'tarizipin2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205010',
                'documentation' => 'tarizipin3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205027',
                'documentation' => 'wayanggolek1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205027',
                'documentation' => 'wayanggolek2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205027',
                'documentation' => 'wayanggolek3.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205028',
                'documentation' => 'wayangkulit1.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205028',
                'documentation' => 'wayangkulit2.jpg',
            ],
            [
                'id_kesenian_img' => 'STR2205028',
                'documentation' => 'wayangkulit3.jpg',
            ],
        ];

        DB::table('images_kesenians')->insert($posts);
    }
}
