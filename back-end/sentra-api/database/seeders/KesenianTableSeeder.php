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
                'category' => 'Tari',
                'community' => 'Seni Tari Kecak',
                'phone_number' => '08919394949',
                'email' => 'tariKecakBali@gmail.com',
                'province' => 'Bali',
                'description' => 'Tari Kecak adalah tarian adat Bali yang telah sangat populer dan telah menjadi keliru keliru pertunjukan khas yang diburu para wisatawan. "
                    Tarian ini diciptakan oleh Wayan Limbak dan Walter Spies pada tahun 1930 oleh seniman Jerman, tarian ini menceritakan epic Ramayana dan rata-rata seluruh penarinya adalah laki – laki. Jumlah penari yang membawakan Tari Kecak mampu berjumlah puluhan lebih-lebih lebih. "
                    Tarian ini sering dipuji oleh wisatawan asing gara-gara keunikannya, walau cuma berbunyi “cak-cak-cak” tetapi beberapa group membunyikannya dengan ketukan berbeda-beda, saat kamu mendengarkan sekelompok laki-laki yang membunyikan kata “cak” kamu seolah mendengarkan ribuan orang yang membunyikan kata “cak”. Inilah keunikan tari kecak. Tari ini disajikan sangat sederhana, tetapi suasana mistisnya masih selamanya ada.
                ',
                'image' => 'tari-kecak-bali.jpg',
                'is_facebook' => 'Seni Tari Kecak',
                'is_instagram' => 'kecak_kita',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205002',
                'name' => 'Tari Musyoh',
                'price' => 11000000,
                'category' => 'Tari',
                'community' => 'Seni Tuah',
                'phone_number' => '08919323949',
                'email' => 'tariMusyohPapua@gmail.com',
                'province' => 'Papua',
                'description' => 'Tari Musyoh adalah tarian sakral yang bertujuan untuk menenangkan arwah yang meninggal karena kecelakaan. Suku adat Papua percaya bahwa jika ada yang meninggal karena kecelakaan, maka arwahnya belum tenang. Sehingga tarian ini dilakukan untuk menenangkan arwah orang meninggal tersebut. Tarian Musyoh juga sering dikenal sebagai tari pengusiran roh yang ada di Papua. Seiring dengan berkembangnya zaman, tarian Musyoh juga sering dipertunjukan untuk penyambutan tamu. Hal ini karena gerak dan irama tarian Musyoh memiliki energi.
                    Jika tari Musyoh dilakukan untuk pengusiran arwah atau yang bertujuan sakral, maka yang menarikan adalah penari pria. Tarian Musyroh yang ditujukan untuk menyambut tamu atau memberikan penghormatan kepada pendatang, maka yang menarikan adalah penari wanita.
                ',
                'image' => '2_papua_tari_musyoh.jpg',
                'is_facebook' => 'Seni Tuah',
                'is_instagram' => 'musyohpapua',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205003',
                'name' => 'Tari Saman',
                'price' => 10000000,
                'category' => 'Tari',
                'community' => 'Sasana Tradisional Saman',
                'phone_number' => '08919394349',
                'email' => 'tariSamanAceh@gmail.com',
                'province' => 'Aceh',
                'description' => 'Tari Saman merupakan salah satu tari tradisional asal Indonesia yang bahkan sudah cukup dikenal di seluruh mancanegara. Tarian satu ini merupakan sebuah tarian suku dataran tinggi Gayo abad ke-XIV Masehi yang biasa ditampilkan ketika perayaan peristiwa-peristiwa penting di dalam adat. Maka dari itu, syair yang terdapat di dalam salah satu tarian dari 34 tari tradisional asal Indonesia ini menggunakan Bahasa Gayo. Di dalam beberapa literatur menyebutkan bahwa Tari Saman dikembangkan oleh Syekh Saman yang merupakan seorang ulama asal Gayo di Aceh Tenggara.
                                Siapapun yang menikmati tari tradisional asal Aceh ini, pasti akan terkagum-kagum dengan kekompakan para penarinya yang bisa dibilang luar biasa. Tari saman ditampilkan dengan cara duduk, rapi, dan berjajar yang tidak sama dengan tarian lainnya yang biasanya melakukan gerakan bebas. Gerakan tepukan dan tempo syair yang khas sangat istimewa karena semua bisa berjalan seirama. Gerakan Tari Saman tidak mungkin dilakukan hanya oleh satu orang saja, maka para penari yang memadukan gerakan menepuk pundak dan tangan ini pasti melakukannya beramai-ramai.
                ',
                'image' => '3_aceh_tari_saman.jpg',
                'is_facebook' => 'Sasana Tradisional Saman',
                'is_instagram' => 'samanaceh',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205004',
                'name' => 'Tari Reog Ponorogo',
                'price' => 17000000,
                'category' => 'Tari',
                'community' => 'Sanggar Seni',
                'phone_number' => '08319394949',
                'email' => 'tariReogPonorogo@gmail.com',
                'province' => 'Jawa Timur',
                'description' => 'Reog Ponorogo termasuk bagian sejarah dan budaya Indonesia. Reog Ponorogo merupakan kesenian yang berasal dari Kota Ponorogo, Jawa Timur, dengan ciri khas Barong, Bujang Ganong, Warok, dan tarian Jathilan. Reog Ponorogo sering ditampilkan dalam kesenian, pentas budaya, dan acara tertentu.
                                Seni Reog Ponorogo merupakan cipta kreasi Indonesia, yang kaya akan budaya. Seni ini terbentuk karena adanya aliran kepercayaan secara turun temurun. Upacaranya pun menggunakan syarat-syarat yang tidak mudah bagi orang awam untuk memenuhinya, tanpa adanya garis keturunan yang jelas.
                ',
                'image' => '4_jawa_timur_tari_reog_ponorogo.jpg',
                'is_facebook' => 'Sanggar Seni',
                'is_instagram' => 'senisanggar',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205005',
                'name' => 'Tari Jaipong',
                'price' => 15000000,
                'category' => 'Tari',
                'community' => 'Production Jaipong',
                'phone_number' => '08129394949',
                'email' => 'jaipongproduction@gmail.com',
                'province' => 'Jawa Barat',
                'description' => 'Tari jaipong adalah sebuah tari daerah yang berasal dari Karawang, Jawa Barat yang berkembang pada tahun 60-an. Mulanya tari jaipong dikenal dengan sebutan tari Banjet, sebuah pertunjukan seni tari yang yang dipentaskan dengan gerakan tari yang diiringi oleh musik dengan instrumen gamelan sebagai pengiringnya.
                                Tari ini dahulu dijadikan sebagai hiburan rakyat, tari jaipong merupakan sebuah inovasi yang dilakukan oleh seorang seniman asal Karawang, tari ini merupakan gabungan dari pencak silat, wayang golek, topeng banjet, ketuk tilu, tarling, dan tepak topeng.
                ',
                'image' => '5_jawa_barat_tari_jaipong.jpg',
                'is_facebook' => 'Production Jaipong',
                'is_instagram' => 'jaipongproduction',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205006',
                'name' => 'Tari Bendana',
                'price' => 8000000,
                'category' => 'Tari',
                'community' => 'Sanggar Budaya',
                'phone_number' => '081243294949',
                'email' => 'bendanatari_sanggar@gmail.com',
                'province' => 'Lampung',
                'description' => 'Tari Bedana adalah tarian tradisional yang berasal dari Lampung yang dibawakan didalam upacara adat daerah Lampung. Tari Bedana menjadi salah satu tari tradisional di Lampung yang mencerminkan tata kehidupan masyarakatnya.
                                Tari Bedana adalah jenis tari berpasangan yang biasanya dibawakan oleh para pemuda dan pemudi Lampung, pada saat acara adat atau acara-acara lainnya. Tarian ini merupakan wujud ungkapan akan rasa suka cita.
                                Ekspresi sukacita ini ditampilkan dalam wujud gerakan anggota tubuh dengan batasan tertentu dengan penuh kegembiraan. Ekstetika tarinya membuat kita merasa selalu muda dan antusias.
                                Tari ini diyakini identik dengan agama Islam karena mencerminkan masyarakat Lampung yang ramah dan terbuka sebagai simbol persahabatan dan pergaulan.
                ',
                'image' => '6_lampung_tari_bandana.jpg',
                'is_facebook' => 'Sanggar Budaya',
                'is_instagram' => 'bendanatari_sanggar',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205007',
                'name' => 'Tari Gambyong',
                'price' => 7000000,
                'category' => 'Tari',
                'community' => 'Art Setter',
                'phone_number' => '08384394946',
                'email' => 'gambyong_setter@gmail.com',
                'province' => 'Jawa Barat',
                'description' => '
                    Tari Gambyong merupakan salah satu bentuk tarian Jawa klasik yang berasal-mula dari wilayah Surakarta dan biasanya dibawakan untuk pertunjukan atau menyambut tamu.
                    Gambyong bukanlah satu tarian saja melainkan terdiri dari bermacam-macam koreografi, yang paling dikenal adalah Tari Gambyong Pareanom (dengan beberapa variasi) dan Tari Gambyong Pangkur (dengan beberapa variasi).
                    Meskipun banyak macamnya, tarian ini memiliki dasar gerakan yang sama, yaitu gerakan tarian tayub. Pada dasarnya, gambyong dicipta untuk penari tunggal, namun sekarang lebih sering dibawakan oleh beberapa penari dengan menambahkan unsur blocking panggung sehingga melibatkan garis dan gerak yang serba besar.
                ',
                'image' => '7_jawa_tengah_tari_gambyong.jpg',
                'is_facebook' => 'Art Setter',
                'is_instagram' => 'gambyong_setter',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205008',
                'name' => 'Tari Topeng',
                'price' => 10000000,
                'category' => 'Tari',
                'community' => 'Topeng Organisasi',
                'phone_number' => '08383463455',
                'email' => 'taritopeng_organisasi@gmail.com',
                'province' => 'Banten',
                'description' => '
                        Tari Topeng berasal dari Cirebon, Jawa Barat, merupakan seni tari pertunjukan yang sarat simbol penuh makna yang diharapkan bisa dipahami penontonnya. Simbol-simbol itu disampaikan melalui warna topeng, jumlah topeng, dan jumlah gamelan pengiringnya. Makna yang disampaikan bisa berupa nilai kepemimpinan, cinta, atau kebijaksanaan yang disampaikan melalui media tari.
                        Siapa empu pencipta tarian ini tak diketahui. Kemunculannya pun ada banyak versi. Salah satunya menyebut tari topeng sudah dikenal pada masa Majapahit. Jacob Sumardjo dalam Arkeologi Budaya Indonesia menyebut Raja Hayam Wuruk menari dengan topeng terbuat dari emas. Setelah jatuhnya Majapahit.
                ',
                'image' => '8_banten_tari_topeng.jpg',
                'is_facebook' => 'Topeng Organisasi',
                'is_instagram' => 'taritopeng_organisasi',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205009',
                'name' => 'Tari Serimpi',
                'price' => 9000000,
                'category' => 'Tari',
                'community' => 'Sukma Sanggar',
                'phone_number' => '08710435435',
                'email' => 'tari_serimpi_sukma@gmail.com',
                'province' => 'Yogyakarta',
                'description' => '
                        Tari serimpi berasal dari tradisi keraton Mataram yang waktu itu masih berada di Daerah Istimewa Yogyakarta. Sehingga, bisa dikatakan bahwa tari serimpi berasal dari Daerah Istimewa Yogyakarta.
                        Dirangkum dari laman Radio Edukasi Kemdikbud, tari serimpi adalah tari klasik yang hanya ditampilkan di wilayah keraton saja. Saat itu, tari serimpi adalah salah satu tarian yang sangat sakral dan mistis.
                        Jadi, tari serimpi berasal dari tradisi keraton ini hanya dimainkan di dalam lingkungan keraton untuk acara kenegaraan dan memperingati kenaikan tahta sultan. Tari serimpi ditampilkan oleh empat orang penari sebagai simbol empat arah mata angin dan empat unsur dunia yakni api, udara, air, dan tanah.
                        Tari ini ditampilkan dengan gerakan lemah gemulai dan diiringi alunan gamelan. Tema tari serimpi adalah pertentangan antara nafsu dan akal serta benar dan salah. Dalam perkembangannya, tari serimpi banyak ditampilkan untuk menyambut tamu agung.
                ',
                'image' => '9_diy_tari_serimpi.jpg',
                'is_facebook' => 'Sukma Sanggar',
                'is_instagram' => 'serimpi_sukma',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205010',
                'name' => 'Tari Zipin',
                'price' => 5600000,
                'category' => 'Tari',
                'community' => 'Cerana Seni Org',
                'phone_number' => '08123403403',
                'email' => 'tari_zipin_tari@gmail.com',
                'province' => 'Riau',
                'description' => '
                    Tari Zapin adalah salah satu tarian tradisional Melayu dari Provinsi Riau yang sangat mengakar dan populer. Zapin berasal dari bahasa Arab yaitu yang mempunyai arti pergerakan kaki cepat mengikut rentak pukulan.
                    Tari Zapin dibawakan secara berkelompok dengan diiringi dua alat musik utama yakni gambus dan marwas yang berbentuk gendang kecil. Biasanya melalui syair-syairnya yang didendangkan tari Zapin ini juga digunakan sebagai media dakwah.
                    Sejarah tari Zapin berawal sebagai tarian hiburan di lingkungan istana di pesisir Selat Malaka seperti Kerajaan Siak dan Indragiri. Tarian ini dibawa dari Hadramaut, Yaman oleh para pedagang Arab sekaligus pendakwah agama Islam pada awal abad ke-16.
                    Karena masuk di lingkungan istana dengan cepat tari Zapin berakulturasi dengan budaya lokal. Dalam setiap gerakannya disisipkan nilai-nilai dan norma Melayu. Akhirnya tari ini kerap ditampilkan dalam acara seremonial kerajaan.
                ',
                'image' => '10_riau_tari_zipin.jpg',
                'is_facebook' => 'Cerana Seni Org',
                'is_instagram' => 'zipin_tari',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205011',
                'name' => 'Tari Cerana',
                'price' => 15000000,
                'category' => 'Tari',
                'community' => 'Puspita Budaya',
                'phone_number' => '08120423424',
                'email' => 'tari_cerana_seni@gmail.com',
                'province' => 'NTT',
                'description' => '
                    Tari Cerana adalah tarian penyambutan atau tarian selamat datang yang khas dari Kupang. Provinsi Nusa Tenggara Timur(NTT). Tarian ini biasanya akan diakhiri dengan menyajikan sirih dan pinang sebagai simbol dari penerimaan masyarakat terhadap tamunya dengan hati yang tulus, bersih dan juga penuh kasih sayang.
                    Kemudian Tamu yang datang akan mengunyah sirih dan pinang yang telah diberikan sebagai simbol bahwa tamu tersebut juga menyambut baik apa yang diberikan oleh masyarakat, sehingga akan terjalin suatu hubungan yang baik diantara mereka.
                ',
                'image' => '11_ntt_tari_cerana.jpg',
                'is_facebook' => 'Puspita Budaya',
                'is_instagram' => 'cerana_seni',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205012',
                'name' => 'Tari Tor Tor',
                'price' => 9900000,
                'category' => 'Tari',
                'community' => 'Diva Indonesia',
                'phone_number' => '08129344303',
                'email' => 'tari_indo_diva@gmail.com',
                'province' => 'Sumatera Utara',
                'description' => '
                    Tari Tortor merupakan salah satu jenis tarian yang berasal dari provinsi Sumatera Utara. Tari Tortor adalah jenis tarian purba dari masyarakat Batak Toba yang mendiami provinsi dengan ibukota Medan.
                    Dikutip dari buku Pemikiran Tentang Batak: Setelah 150 Tahun Agama Kristen di Sumatera Utara (2011) karya diedit oleh Bungaran Antonius Simanjuntak, Tortor Batak Toba sebagai tarian tradisional yang telah membudaya.
                    Di mana mempunyai tempat dan kedudukan yang penting dalam kehidupan masyarakat adat. Dalam setiap pelaksanaan adat, Tortor selalu digelar. Dalam pelaksanaan adat, baik yang berhubungan dengan kematian maupun peristiwa sukacita, tortor selalu diadakan. Tari Tortor merupakan bagian penting dalam masyarakat adat Batak, yang memiliki nilai budaya dan nilai spiritual.
                ',
                'image' => '12_sumatera_utara_tari_tor_tor.jpg',
                'is_facebook' => 'Diva Indonesia',
                'is_instagram' => 'indo_diva',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205013',
                'name' => 'Tari Kipas Pakarena',
                'price' => 6700000,
                'category' => 'Tari',
                'community' => 'Pakarena Entertain',
                'phone_number' => '08124309044',
                'email' => 'kipas_pakarena@gmail.com',
                'province' => 'Sulawesi Selatan',
                'description' => '
                    Tarian kipas adalah kesenian tari daerah yang berasal dari Gowa, Provinsi Sulawesi Selatan. Di daerah Gowa, nama tarian ini mempunyai nama Tari Kipas Pakarena.
                    Berdasarkan sejarah, Tari Kipas Pakarena merupakan salah satu kesenian tari peninggalan dari Kerajaan Gowa. Dahulunya, kerajaan itu mengalami masa kejayaan dan berhasil menguasai daerah Sulawesi yang berada di bagian selatan sejak bertahun-tahun.
                    Menurut bahasa dari daerah setempat kata “Pakarena” berasal dari kata “karena” yang mempunyai makna yaitu “main”. Tarian ini sendiri telah dijadikan sebagai tarian daerah oleh masyarakat daerah Gowa yang dahulunya adalah bekas dari Kerajaan Gowa.
                    Tarian daerah ini dulunya, dimainkan di dalam istana Kerajaan Gowa oleh seorang putri-putri bangsawan. Tari Kipas Pakarena tersebut juga digunakan sebagai bentuk pelengkap maupun suatu hal wajib dipertunjukkan ketika ada upacara adat, pesta kerajaan, dan lain sebagainya.
                ',
                'image' => '13_sulawesi_selatan_tari_kipas_pakarena.jpg',
                'is_facebook' => 'Pakarena Entertain',
                'is_instagram' => 'kipas_pakarena',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205014',
                'name' => 'Tari Piring',
                'price' => 9000000,
                'category' => 'Tari',
                'community' => 'Budaya Tari',
                'phone_number' => '08429243402',
                'email' => 'tari_piring_budaya@gmail.com',
                'province' => 'Sumatera Barat',
                'description' => '
                    Tari piring juga disebut dengan tari kelompok yang dibawakan lebih dari dua penari. Ciri khas dari tari piring adalah para penari membawa piring di kedua tangannya, dengan permukaan piring menghadap ke luar.
                    Tari piring ditarikan dengan gerakan-gerakan yang dinamis, lincah, energik dan bahkan terkesan akrobatik karena sering menampilkan gerakan-gerakan yang sulit.
                    Mengutip dalam buku "Seni dan Budaya" karya Harry Sulastianto, dkk, gerakan-gerakan yang terdapat dalam Tari Piring antara lain gerak batanam (bertanam), gerak manyabik (menyabit), gerak mengirik (mengirik padi), dan gerak baguliang (berguling).
                    Gerakan-gerakan tersebut merupakan gambaran peristiwa kegiatan masyarakat dalam bekerja. Tari piring diiringi oleh musik tradisional yang disebut talempong. Musik talempong terdiri atas enam buah talempong, satu buah gong kecil, satu buah tambua, satu buah botol dan sejenis kerincing.
                ',
                'image' => '14_sumatera_barat_tari_piring.jpg',
                'is_facebook' => 'Budaya Tari',
                'is_instagram' => 'tari_piring_budaya',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205015',
                'name' => 'Tari Gantar',
                'price' => 8000000,
                'category' => 'Tari',
                'community' => 'Seroajya',
                'phone_number' => '08139453455',
                'email' => 'seroajya@gmail.com',
                'province' => 'Kalimantan Timur',
                'description' => '
                    Tari Gantar berasal dari Suku Dayak Benuaq dan Dayak Tunjung di Kabupaten Kutai Barat, Kalimantan Timur.
                    Seni ini merupakan jenis tarian pergaulan antara muda mudi yang dipentaskan dalam upacara selamatan untuk memohon berkah kepada Dewi Sri atau Dewi Padi. Hal tersebut dijelaskan oleh Drs. Ida Bagus Sudirga dalam buku Agama Hindu SMA. Pada zaman dahulu, setelah selesai menampilkan Tari Gantar, seekor kerbau disembelih sebagai korban.
                    Menurut kepercayaan masyarakat, jika darah kerbau yang disembelih menyembur dengan sangat deras, berarti hasil panen akan berlimpah. Mengutip Kementerian Pendidikan dan Kebudayaan, Tari Gantar melambangkan kegembiraan dan juga keramahan Suku Dayak dalam menyambut tamu yang datang berkunjung, baik sebagai wisatawan, investor, atau para tamu yang dihormati. Bahkan, mereka diajak menari bersama para penari.
                ',
                'image' => '15_kalimatan_timur_tari_gantar.jpg',
                'is_facebook' => 'Seroajya',
                'is_instagram' => 'seroajya',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205016',
                'name' => 'Tari Ondel-Ondel',
                'price' => 5000000,
                'category' => 'Tari',
                'community' => 'Damai Seni',
                'phone_number' => '08382048944',
                'email' => 'DamaiSeni@gmail.com',
                'province' => 'DKI Jakarta',
                'description' => '
                    Tari kreasi yang terinspirasi dari boneka besar khas Betawi “ondel-ondel”, yang namanya juga diambil sebagai nama tariannya. Ondel-ondel adalah boneka besar yang dibuat dari anyaman bambu dengan ukuran tinggi ± 2,5 meter dan diameter ± 0,8 meter. Bagian dalamnya  dibuat sedemikian rupa agar mudah dipikul oleh orang yang masuk ke dalamnya. Wajah ondel-ondel berupa topeng atau kedok dengan rambut kepala berbahan ijuk dan diberi hiasan kembang kelapa.
                    Boneka laki-laki mengenakan topeng berwarna merah, sedangkan yang perempuan berwarna putih. Ondel-ondel biasanya ditampilkan untuk menyambut tamu dan memeriahkan pesta-pesta rakyat. Konon ondel-ondel dipercaya sebagai penolak bala. Tari Ondel-ondel tidak mengusung boneka khas Betawi ini sebagai properti, tetapi menggantinya dengan tampah kecil berhiaskan wajah khas ondel-ondel yang dibawa oleh masing-masing penari. Terkadang menggunakan media lain seperti karton, dan ada juga yang tidak mengenakannya sama sekali.
                ',
                'image' => '16_dki_jakarta_tari_ondel_ondel.jpg',
                'is_facebook' => 'Damai Seni',
                'is_instagram' => 'damai_ondeljkt',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205017',
                'name' => 'Tari Gending Sriwijaya',
                'price' => 12000000,
                'category' => 'Tari',
                'community' => 'Tari Geding Group',
                'phone_number' => '08122934039',
                'email' => 'geding_group@gmail.com',
                'province' => 'Sumatera Selatan',
                'description' => '
                    Tari Gending Sriwijaya merupakan tarian tradisional dari Palembang, Sumatera Selatan. Tari tradisional ini digunakan untuk menyambut tamu para raja yang tak hanya indah namun penuh dengan makna.
                    Budaya penyambutan tamu besar dengan tarian ini ternyata sudah dilakukan sejak zaman dahulu.
                    Melansir laman resmi kebudayaan.kemdikbud.go.id, sejarah Tari Gending Sriwijaya muncul dari permintaan pemerintah Jepang agar Hodohan (Jawatan Penerangan Jepang) menciptakan tari dan lagu untuk menyambut tamu secara resmi.
                    Tarian ini digagas dari tahun 1942 hingga 1943 dan sempat terkendala akibat kondisi politik di tanah air. Baru pada bulan Oktober 1943 ditindaklanjuti ketika O.M. Shida menunjuk Nungtjik A.R. yang merupakan Wakil Kepala Hodohan pengganti M.J. Su’ud.
                ',
                'image' => '17_sumatera_selatan_tari_gending_sriwijaya.jpg',
                'is_facebook' => 'Tari Geding Group',
                'is_instagram' => 'geding_group',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205018',
                'name' => 'Tari Pedang Mualang',
                'price' => 8000000,
                'category' => 'Tari',
                'community' => 'Cahaya Group',
                'phone_number' => '08571293013',
                'email' => 'mualang_cahaya@gmail.com',
                'province' => 'Kalimantan Barat',
                'description' => '
                    Tari Pedang Mualang Kalimantan Barat menjadi salah satu daerah yang kaya akan budaya tradisionalnya yang masih dipegang teguh dan dirawat hingga sekarang.
                    Banyak suku-suku yang mendiami wilayah Kalimantan Barat masih menjaga adat istiadat dan aturan-aturan yang dibentuk sejak zaman nenek moyang.
                    Salah satu suku yang begitu terkenal di Kalimantan Barat adalah Suku Dayak.
                    Suku Dayak ini terkenal dengan keanekaragaman budayanya yang sangat menarik untuk dipelajari, salah satunya budaya kesenian tari.
                    Membicarakan kesenian tari di Suku Dayak, ada satu tarian yang begitu menarik dan akan dibahas disini, namanya adalah Tari Pedang Mualang.
                ',
                'image' => '18_kalimantan_barat_tari_pedang_mualang.jpg',
                'is_facebook' => 'Cahaya Group',
                'is_instagram' => 'mualang_cahaya',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205019',
                'name' => 'Tari Campak',
                'price' => 6000000,
                'category' => 'Tari',
                'community' => 'Mutiara Ria',
                'phone_number' => '08993924843',
                'email' => 'tari_mutiara_Ria@gmail.com',
                'province' => 'Bangka Belitung',
                'description' => '
                    Tari Campak. Tarian yang merupakan tarian dari daerah Bangka Belitung ini, menggambarkan keceriaan bujang dan dayang di Kepulauan Bangka Belitung.
                    Pada awalnya, Tari Campak ini ditampilkan pada waktu tertentu aja, yakni pada saat masuk musim panen padi atau sepulang dari ume (kebun). Namun seiring perkembangan zaman, Tari Campak ini mengalami perluasan gelarannya pada acara-acara penting,
                    seperti penyambutan tamu, pesta rakyat, adat pernikahan dan lain sebagainya. Perluasan gelaran Tari Campak ini terjadi karena adanya keinginan untuk melihat serta kekaguman orang lain atas gerakan tarian yang menarik untuk disaksikan.
                    Tarian ini berkembang pada masa pendudukan bangsa Portugis di Bangka Belitung. Hal ini bisa dilihat dari beberapa ragam pada tari Campak antara lain akordion dan pakaian pada penari perempuan yang sangat kental dengan gaya Eropa nya.
                ',
                'image' => '19_bangka_belitung_tari_campak.jpg',
                'is_facebook' => 'Mutiara Ria',
                'is_instagram' => 'tari_mutiara_Ria',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205020',
                'name' => 'Tari Yerik',
                'price' => 11500000,
                'category' => 'Tari',
                'community' => 'Rebana Production',
                'phone_number' => '08992034290',
                'email' => 'rebana_production@gmail.com',
                'province' => 'Maluku',
                'description' => '
                    Tari Yerik merupakan merupakan tarian masyarakat Maluku sebagai bentuk permintaan kepada Tuhan untuk keselamatan ketika bencana datang seperti badai yang tidak berhenti, perang yang tidak berakhir dan musim kemarau yang panjang agar diberi hujan.
                    Tarian ini sangat terkenal di Maluku Tenggara, selain itu tarian ini juga pernah dipentaskan di panggung internasional.
                    Salah satunya di negara Turki saat ada festival budaya yang dihadiri oleh 7 negara yaitu Indonesia, Turki, India, Sri Langka, Belgia, Korea Utara dan Ukraina.
                ',
                'image' => '20_maluku_tari_yerik.jpg',
                'is_facebook' => 'Rebana Production',
                'is_instagram' => 'rebana_production',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205021',
                'name' => 'Tari Topeng Banjar',
                'price' => 7500000,
                'category' => 'Tari',
                'community' => 'Citra Art Indonesia',
                'phone_number' => '08573453453',
                'email' => 'citrartindonesia@gmail.com',
                'province' => 'Kalimantan Selatan',
                'description' => '
                    Tari Topeng Banjar adalah jenis tarian tradisional yang dipergunakan dalam upacara sakral, seperti upacara manyanggar (Sampir). Tarian untuk upacara sakral ini bisa juga berfungsi untuk keperluan Batatamba (pengobatan) terhadap orang sakit seperti kapingitan."
                    Tari topeng ini diketahui sudah tumbuh dan berkembang sejak Kerajaan Negara Dipa. Bentuk topeng Banjar terdiri dari beberapa jenis seperti Gunung Sari, Patih, Panji, Batarakala (Sangkala/Gajah Barung), Pantul, Tambam, Pamambi, Pamimdu, Kalana, Ranggajiwa, dan lain - lain. Perhelatan tari topeng banjar masih dilakukan sebagai ungkapan rasa syukur, mengharap keselamatan dari gangguan roh jahat.
                ',
                'image' => '21_kalimantan_selatan_tari_topeng_banjar.jpg',
                'is_facebook' => 'Citra Art Indonesia',
                'is_instagram' => 'citrartindonesia',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205022',
                'name' => 'Tari Giring-Giring',
                'price' => 7000000,
                'category' => 'Tari',
                'community' => 'Prima Indonesia',
                'phone_number' => '08380239484',
                'email' => 'prima_tariindonesia@gmail.com',
                'province' => 'Kalimantan Tengah',
                'description' => '
                    Tari Giring-Giring adalah tarian khas yang berasal dari Suku Dayak Maanyan yang mendiami Provinsi Kalimantan Tengah.
                    Tari tradisional tersebut dikenal dengan istilah ganggerang, yaitu sebuah bambu yang berisi biji piding.
                    Dikutip dari situs Pemerintah Provinsi Kalimantan Tengah, tari Giring-Giring merupakan tarian sebagai bentuk ekspresi kegembiraan dan juga rasa kasih sayang.
                    Simbol pada tarian tersebut adalah gerakan hentakkan satu tongkat gantar yang dipegang tangan kiri ke lantai. Untuk tangan kanan memegang bambu yang berisi kerikil, sehingga menghasilkan bunyi yang khas.
                    Biasanya tari Giring-Giring ditampilkan untuk menyambut kedatangan tamu-tamu istimewa. Bahkan terkadang dijadikan tarian pergaulan para muda-muda di Kalimantan.
                ',
                'image' => '22_kalimantan_tengah_tari_giring_giring.jpg',
                'is_facebook' => 'Prima Indonesia',
                'is_instagram' => 'prima_tariindonesia',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205023',
                'name' => 'Tari Gandrung',
                'price' => 11000000,
                'category' => 'Tari',
                'community' => 'Bali Tari Sanggar',
                'phone_number' => '08990239493',
                'email' => 'bali_tari@gmail.com',
                'province' => 'NTB',
                'description' => '
                    Tarian Gandrung yang merupakan khas Banyuwangi dibawakan sebagai perwujudan rasa syukur masyarakat setelah panen. Gandrung merupakan seni pertunjukan yang disajikan dengan iringan musik khas perpaduan budaya Jawa dan Bali.
                    Tarian ini adalah salah satu bentuk kebudayaan dari Suku Osing yang merupakan penduduk asli Banyuwangi. Tarian ini dipentaskan dalam bentuk berpasangan antara perempuan (penari gandrung) dan laki-laki (pemaju) yang dikenal dengan paju.
                ',
                'image' => '23_ntb_tari_gandrung.jpg',
                'is_facebook' => 'Bali Tari Sanggar',
                'is_instagram' => 'bali_tari',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205024',
                'name' => 'Tari Maengket',
                'price' => 8500000,
                'category' => 'Tari',
                'community' => 'Trisna Organisasi',
                'phone_number' => '08788324944',
                'email' => 'manengket_organisasi@gmail.com',
                'province' => 'Sulawesi Utara',
                'description' => '
                    Tari Maengket salah satu tari tradisional suku Minahasa di Sulawesi Utara. Tari Maengket awalnya menjadi tarian ucapan terima kasih kepada Tuhan Yang Maha Esa atas panen yang baik.
                    Kemudian dalam perkembangannya, tarian ini tidak hanya ditarikan pada saat usai panen, melainkan juga acara-acara lain, seperti pesta pernikahan, festival seni tari, dan lainnya.
                    Dilansir dari situs Kementerian Pendidikan dan Kebudayaan Republik Indonesia, kata maengket berasal dari tradisi budaya gotong royong di Minahasa dalam kegiatan sehari-hari, terutama saat bercocok tanam. Seiring berkembangnya zaman, maengket diartikan sebagai seni bernyanyi sambil menari dengan mengungkapkan sastra daerah yang dilakukan oleh sekelompok orang.
                ',
                'image' => '24_sulawesi_utara_tari_maengket.jpg',
                'is_facebook' => 'Trisna Organisasi',
                'is_instagram' => 'manengket_organisasi',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205025',
                'name' => 'Tari Mance',
                'price' => 9000000,
                'category' => 'Tari',
                'community' => 'Bulungan Group',
                'phone_number' => '08788932480',
                'email' => 'bulungangroup@gmail.com',
                'province' => 'Kalimantan Utara',
                'description' => '
                    Tari Mance atau Bemance adalah tarian daerah yang berasal dari Kalimantan Utara, Suku Bulungan.
                    Tarian ini memiliki gerakan yang sama dengan silat, akan tetapi lebih luwes dan terlihat seperti tari untuk hiburan.
                    Tari Mance merupakan tarian Kalimantan Utara yang sangat digemari sebagaian besar pemuda di daerah Bulungan.
                ',
                'image' => '25_kalimantan_utara_tari_mance.jpg',
                'is_facebook' => 'Bulungan Group',
                'is_instagram' => 'bulungangroup',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205026',
                'name' => 'Debus',
                'price' => 2500000,
                'category' => 'Tari & Musik',
                'community' => 'Banten Organisasi',
                'phone_number' => '08788324432',
                'email' => 'debus_banten@gmail.com',
                'province' => 'Banten',
                'description' => '
                    Debus merupakan kesenian tradisional yang terdapat di Provinsi Banten yang menampilkan atraksi kekebalan tubuh manusia dari berbagai macam benda tajam.
                    Seni debus perpaduan antara seni tari, suara serta kebatinan bernuansa magis. Awalnya, kesenian debus berfungsi sebagai sarana untuk menyebarkan ajaran Islam.
                    Seni debus perlahan kemudian berkembang sebagai media untuk memompa semangat rakyat Banten dalam menghadapi penjajahan Belanda pada masa pemerintahan Sultan Ageng Tirtayasa.
                ',
                'image' => '26_banten_debus.jpg',
                'is_facebook' => 'Banten Organisasi',
                'is_instagram' => 'debus_banten',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205027',
                'name' => 'Wayang Golek',
                'price' => 5500000,
                'category' => 'Teater',
                'community' => 'Sanggar Seni Wayang Golek',
                'phone_number' => '08959234834',
                'email' => 'bank_sanggarwayang@gmail.com',
                'province' => 'Jawa Barat',
                'description' => '
                    Wayang golek berasal dari wilayah Pasudan, Jawa Barat. Penamaan wayang golek karena wayang terbuat dari bahan kayu yang menyerupai bentuk manusia. Boneka dari kayu itulah disebut golek sehingga dinamakan wayang golek.
                    Pengertian wayang menurut Kamus Besar Bahasa Indonesia (2008) merupakan boneka tiruan yang terbuat dari pahatan kulit, kayu, dan sebagainya. Boneka ini dimanfaatkan untuk memerankan tokoh dalam pertunjukkan drama tradisional.
                    Di Jawa Barat, kesenian wayang golek difungsikan ke dalam dua bentuk pagelaran, yaitu sebagai media hiburan dan upacara ritual.
                    Pertunjukkan wayang golek dilakukan secara tatap langsung, artinya ada tatap langsung antara dalang dengan penonton. Dalang bertindak sebagai pencerita maupun sebagai pemain wayang.
                ',
                'image' => '27_jawa_barat_wayang_golek.jpg',
                'is_facebook' => 'Sanggar Seni Wayang Golek',
                'is_instagram' => 'bank_sanggarwayang',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205028',
                'name' => 'Wayang Kulit',
                'price' => 6000000,
                'category' => 'Teater',
                'community' => 'Sanggar Seni Wayang Kulit',
                'phone_number' => '08958324432',
                'email' => 'bank_wayangkulit@gmail.com',
                'province' => 'Jawa Timur',
                'description' => '
                    Seni Wayang Kulit telah ditetapkan UNESCO sebagai Warisan Budaya Tak Benda pertama Indonesia dalam kategori Representative List of the Intangible Cultural Heritage of Humanity pada tahun 2003.
                    Wayang kulit adalah kesenian dengan menggunakan bentuk karakter mitologi yang biasanya dibuat dengan menggunakan lembaran kulit binatang (kerbau atau sapi) yang dikeringkan.
                    Dimainkan oleh seorang dalang, wayang kulit membawa cerita-cerita dengan pesan yang berasal dari kepercayaan dan budaya setempat mengenai budi pekerti luhur, atau bahkan berupa kritik sosial.
                ',
                'image' => '28_jawa_timur_wayang_kulit.jpg',
                'is_facebook' => 'Sanggar Seni Wayang Kulit',
                'is_instagram' => 'bank_wayangkulit',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205029',
                'name' => 'Pencak Silat',
                'price' => 3500000,
                'category' => 'Beladiri',
                'community' => 'Seni Pencak Silat Indonesia',
                'phone_number' => '08128932443',
                'email' => 'turning_art@gmail.com',
                'province' => 'Sumatra Barat',
                'description' => '
                    Sejarah pencak silat Indonesia sudah hadir semenjak abad ke-7. Pencak silat bermula dari perkembangan keterampilan suku asli Indonesia dalam berburu dan perang dengan menggunakan alat perang seperti parang, perisai, dan tombak. Catatan mengenai sejarah pencak silat terdokumentasikan dalam berbagai artefak senjata yang ditemukan pada peninggalan Hindu Budha seperti pahatan relief-relief yang menggambarkan sikap kuda-kuda silat di Candi Prambanan dan Borobudur
                    Ajaran Islam juga ikut menggoreskan catatan mengenai sejarah pencak silat yang dimulai pada abad ke 14 di Nusantara oleh kaum penyebar ajaran Islam, dan diajarkan di pesantren sebagai bagian dari latihan spiritual.
                    Banyak tokoh yang ikut berkecimpung dalam proses pengembangan dan mewarnai sejarah pencak silat. Seperti: Panembahan Senopati, Sultan Agung, Pangeran Diponegoro, Teungku Chik di Tiro, Teuku Umar, Tuanku Imam Bonjol, serta para pendekar wanita, seperti Sabai Nan Aluih, Cut Nyak Dhien, dan Cut Nyak Meutia.
                    Banyaknya tokoh Islam yang mengembangkan pencak silat karena catatan sejarah pencak silat banyak diwarnai di kaum penyebar agama Islam pada abad ke-14 di Nusantara. Kala itu pencak silat diajarkan bersama-sama dengan pelajaran agama di surau atau pesantren. Silat menjadi bagian dari latihan spiritual.
                ',
                'image' => '29_jawa_barat_pencak_silat.jpg',
                'is_facebook' => 'Seni Pencak Silat Indonesia',
                'is_instagram' => 'turning_art',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR2205030',
                'name' => 'Pertunjukan Angklung',
                'price' => 50000000,
                'category' => 'Musik',
                'community' => 'Yudha Sari Angklung',
                'phone_number' => '08150900907',
                'email' => 'yudhasari_Angklung@gmail.com',
                'province' => 'Jawa Barat',
                'description' => '
                    Angklung adalah alat musik bernada ganda yang telah dikenal sejak abad ke 11."
                    Untuk nama angklung sendiri berasal dari Bahasa Sunda yaitu angkleung-angkleungan. Terdiri dari dua suku kata yaitu angka yang berarti nada dan lung yang berarti pecah.
                    Bunyi pada angklung tersebut dihasilkan oleh benturan badan pipa bambu sehingga menghasilkan bunyi yang bergetar dalam susunan nada 2, 3, sampai 4 nada dalam setiap ukuran, baik besar maupun kecil.
                    Menurut situs resmi Pemerintah Daerah Provinsi Jawa Barat, terciptanya alat musik angklung yang terbuat dari bambu berasal dari pandangan hidup masyarakat Sunda yang agraris.
                    Dengan kehidupan yang bersumber pada makanan pokok berupa padi ini kemudian muncul mitos Nji Sri Pohaci sebagai Dewi Sri pemberi kehidupan perenungan bagi masyarakat Sunda dahulu dalam mengelola pertanian terutama pertanian sawah dan
                    ladang Syair lagu yang berkembang di masyarakat Sunda dianggap sebagai penghormatan dan persembahan kepada Nyi Sri Pohaci dan sebagai tolak bala agar bercocok tanam mereka tidak mendatangkan malapetaka
                    Dalam perkembangannya syair lagu-lagu tersebut diiringi dengan bunyi tetabuhan yang terbuat dari batang-batang bambu yang dibuat sederhana yang kemudian kita kenal dengan nama angklung.
                ',
                'image' => '30_jawa_barat_angklung.jpg',
                'is_facebook' => 'Yudha Sari Angklung',
                'is_instagram' => 'yudhasari_Angklung',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'id_kesenian' => 'STR220502x',
                'name' => '',
                'price' => 0,
                'category' => '',
                'community' => '',
                'phone_number' => '',
                'email' => '@gmail.com',
                'province' => '',
                'description' => '

                ',
                'image' => '',
                'is_facebook' => '',
                'is_instagram' => '',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],

        ];

        DB::table('kesenians')->insert($posts);
    }
}
