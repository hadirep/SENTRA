<?php

namespace Database\Seeders;

use App\Models\Kesenian;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class KesenianTableSeeder extends Seeder
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
                'id_kesenian' => 'STR2205001',
                'name' => 'Tari Kecak',
                'price' => 15000000,
                'category' => '',
                'community' => '',
                'phone_number' => null,
                'email' => '',
                'province' => 'Bali',
                'description' => 'Tari Kecak adalah tarian adat Bali yang telah sangat populer dan telah menjadi keliru keliru pertunjukan khas yang diburu para wisatawan.
                Tarian ini diciptakan oleh Wayan Limbak dan Walter Spies pada tahun 1930 oleh seniman Jerman, tarian ini menceritakan epic Ramayana dan rata-rata seluruh penarinya adalah laki – laki. Jumlah penari yang membawakan Tari Kecak mampu berjumlah puluhan lebih-lebih lebih.
                Tarian ini sering dipuji oleh wisatawan asing gara-gara keunikannya, walau cuma berbunyi “cak-cak-cak” tetapi beberapa group membunyikannya dengan ketukan berbeda-beda, saat kamu mendengarkan sekelompok laki-laki yang membunyikan kata “cak” kamu seolah mendengarkan ribuan orang yang membunyikan kata “cak”. Inilah keunikan tari kecak. Tari ini disajikan sangat sederhana, tetapi suasana mistisnya masih selamanya ada.
                ',
                'image' => 'tari-kecak-bali.jpg',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205002',
                'name' => 'Tari Musyoh',
                'price' => 11000000,
                'category' => '',
                'community' => '',
                'phone_number' => null,
                'email' => '',
                'province' => 'Papua',
                'description' => 'Tari Musyoh adalah tarian sakral yang bertujuan untuk menenangkan arwah yang meninggal karena kecelakaan. Suku adat Papua percaya bahwa jika ada yang meninggal karena kecelakaan, maka arwahnya belum tenang. Sehingga tarian ini dilakukan untuk menenangkan arwah orang meninggal tersebut. Tarian Musyoh juga sering dikenal sebagai tari pengusiran roh yang ada di Papua. Seiring dengan berkembangnya zaman, tarian Musyoh juga sering dipertunjukan untuk penyambutan tamu. Hal ini karena gerak dan irama tarian Musyoh memiliki energi.
                Jika tari Musyoh dilakukan untuk pengusiran arwah atau yang bertujuan sakral, maka yang menarikan adalah penari pria. Tarian Musyroh yang ditujukan untuk menyambut tamu atau memberikan penghormatan kepada pendatang, maka yang menarikan adalah penari wanita.
                ',
                'image' => '',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205003',
                'name' => 'Tari Saman',
                'price' => 10000000,
                'category' => '',
                'community' => '',
                'phone_number' => null,
                'email' => '',
                'province' => 'Aceh',
                'description' => 'Tari Saman merupakan salah satu tari tradisional asal Indonesia yang bahkan sudah cukup dikenal di seluruh mancanegara. Tarian satu ini merupakan sebuah tarian suku dataran tinggi Gayo abad ke-XIV Masehi yang biasa ditampilkan ketika perayaan peristiwa-peristiwa penting di dalam adat. Maka dari itu, syair yang terdapat di dalam salah satu tarian dari 34 tari tradisional asal Indonesia ini menggunakan Bahasa Gayo. Di dalam beberapa literatur menyebutkan bahwa Tari Saman dikembangkan oleh Syekh Saman yang merupakan seorang ulama asal Gayo di Aceh Tenggara.
                Siapapun yang menikmati tari tradisional asal Aceh ini, pasti akan terkagum-kagum dengan kekompakan para penarinya yang bisa dibilang luar biasa. Tari saman ditampilkan dengan cara duduk, rapi, dan berjajar yang tidak sama dengan tarian lainnya yang biasanya melakukan gerakan bebas. Gerakan tepukan dan tempo syair yang khas sangat istimewa karena semua bisa berjalan seirama. Gerakan Tari Saman tidak mungkin dilakukan hanya oleh satu orang saja, maka para penari yang memadukan gerakan menepuk pundak dan tangan ini pasti melakukannya beramai-ramai.
                Pada 24 November 2011, Tari Saman ditetapkan UNESCO sebagai Daftar Representatif Budaya Takbenda Warisan Manusia dalam sidang ke-6 Komite Antar-Pemerintah untuk Perlindungan Warisan Budaya Tak Benda UNESCO di Bali.
                ',
                'image' => '',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205004',
                'name' => 'Tari Reog Ponorogo',
                'price' => 17000000,
                'category' => '',
                'community' => '',
                'phone_number' => null,
                'email' => '',
                'province' => 'Jawa Timur',
                'description' => 'Reog Ponorogo termasuk bagian sejarah dan budaya Indonesia. Reog Ponorogo merupakan kesenian yang berasal dari Kota Ponorogo, Jawa Timur, dengan ciri khas Barong, Bujang Ganong, Warok, dan tarian Jathilan. Reog Ponorogo sering ditampilkan dalam kesenian, pentas budaya, dan acara tertentu.
                Seni Reog Ponorogo merupakan cipta kreasi Indonesia, yang kaya akan budaya. Kesenian ini terbentuk karena adanya aliran kepercayaan secara turun temurun. Upacaranya pun menggunakan syarat-syarat yang tidak mudah bagi orang awam untuk memenuhinya, tanpa adanya garis keturunan yang jelas.
                ',
                'image' => '',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205005',
                'name' => 'Tari Jaipong ',
                'price' => 15000000,
                'category' => '',
                'community' => '',
                'phone_number' => null,
                'email' => '',
                'province' => 'Jawa Barat',
                'description' => 'Tari jaipong adalah sebuah tari daerah yang berasal dari Karawang, Jawa Barat yang berkembang pada tahun 60-an. Mulanya tari jaipong dikenal dengan sebutan tari Banjet, sebuah pertunjukan seni tari yang yang dipentaskan dengan gerakan tari yang diiringi oleh musik dengan instrumen gamelan sebagai pengiringnya.
                Tari ini dahulu dijadikan sebagai hiburan rakyat, tari jaipong merupakan sebuah inovasi yang dilakukan oleh seorang seniman asal Karawang, tari ini merupakan gabungan dari pencak silat, wayang golek, topeng banjet, ketuk tilu, tarling, dan tepak topeng
                ',
                'image' => '',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
        ];

        DB::table('kesenians')->insert($posts);
    }
}
