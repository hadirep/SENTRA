class ArtUpdate {
  String provience;
  String name;
  String id;
  int price;
  String description;
  String image;

  ArtUpdate({
    required this.provience,
    required this.name,
    required this.id,
    required this.price,
    required this.description,
    required this.image,
  });
}

List<ArtUpdate> dataArtUpdate = [
  ArtUpdate(
    id: "1",
    provience: "Banten",
    name: "Tari Topeng",
    price: 10000000,
    description: "Tari Topeng berasal dari Cirebon, Jawa Barat, merupakan seni tari pertunjukan yang sarat simbol penuh makna yang diharapkan bisa dipahami penontonnya. Simbol-simbol itu disampaikan melalui warna topeng, jumlah topeng, dan jumlah gamelan pengiringnya. Makna yang disampaikan bisa berupa nilai kepemimpinan, cinta, atau kebijaksanaan yang disampaikan melalui media tari."
        "\nSiapa empu pencipta tarian ini tak diketahui. Kemunculannya pun ada banyak versi. Salah satunya menyebut tari topeng sudah dikenal pada masa Majapahit. Jacob Sumardjo dalam Arkeologi Budaya Indonesia menyebut Raja Hayam Wuruk menari dengan topeng terbuat dari emas. Setelah jatuhnya Majapahit.",
    image: "assets/seni/8_banten_tari_topeng.jpg",
  ),
  ArtUpdate(
    id: "2",
    provience: "Jawa Barat",
    name: "Tari Jaipong",
    price: 15000000,
    description: "Tari jaipong adalah sebuah tari daerah yang berasal dari Karawang, Jawa Barat yang berkembang pada tahun 60-an. Mulanya tari jaipong dikenal dengan sebutan tari Banjet, sebuah pertunjukan seni tari yang yang dipentaskan dengan gerakan tari yang diiringi oleh musik dengan instrumen gamelan sebagai pengiringnya."
        "\nTari ini dahulu dijadikan sebagai hiburan rakyat, tari jaipong merupakan sebuah inovasi yang dilakukan oleh seorang seniman asal Karawang, tari ini merupakan gabungan dari pencak silat, wayang golek, topeng banjet, ketuk tilu, tarling, dan tepak topeng.",
    image: "assets/seni/5_jawa_barat_tari_jaipong.jpg",
  ),
  ArtUpdate(
    id: "3",
    provience: "Jawa Barat",
    name: "Tari Gambyong",
    price: 7000000,
    description: "Tari Gambyong merupakan salah satu bentuk tarian Jawa klasik yang berasal-mula dari wilayah Surakarta dan biasanya dibawakan untuk pertunjukan atau menyambut tamu."
        "\nGambyong bukanlah satu tarian saja melainkan terdiri dari bermacam-macam koreografi, yang paling dikenal adalah Tari Gambyong Pareanom (dengan beberapa variasi) dan Tari Gambyong Pangkur (dengan beberapa variasi)."
        "\nMeskipun banyak macamnya, tarian ini memiliki dasar gerakan yang sama, yaitu gerakan tarian tayub. Pada dasarnya, gambyong dicipta untuk penari tunggal, namun sekarang lebih sering dibawakan oleh beberapa penari dengan menambahkan unsur blocking panggung sehingga melibatkan garis dan gerak yang serba besar.",
    image: "assets/seni/7_jawa_tengah_tari_gambyong.jpg",
  ),
  ArtUpdate(
    id: "4",
    provience: "Jawa Timur",
    name: "Tari Reog Ponorogo",
    price: 17000000,
    description: "Reog Ponorogo termasuk bagian sejarah dan budaya Indonesia. Reog Ponorogo merupakan kesenian yang berasal dari Kota Ponorogo, Jawa Timur, dengan ciri khas Barong, Bujang Ganong, Warok, dan tarian Jathilan. Reog Ponorogo sering ditampilkan dalam kesenian, pentas budaya, dan acara tertentu."
        "\nSeni Reog Ponorogo merupakan cipta kreasi Indonesia, yang kaya akan budaya. Seni ini terbentuk karena adanya aliran kepercayaan secara turun temurun. Upacaranya pun menggunakan syarat-syarat yang tidak mudah bagi orang awam untuk memenuhinya, tanpa adanya garis keturunan yang jelas.",
    image: "assets/seni/4_jawa_timur_tari_reog_ponorogo.jpg",
  ),
  ArtUpdate(
    id: "5",
    provience: "Sumatera Barat",
    name: "Tari Piring",
    price: 9000000,
    description: "Tari piring juga disebut dengan tari kelompok yang dibawakan lebih dari dua penari. Ciri khas dari tari piring adalah para penari membawa piring di kedua tangannya, dengan permukaan piring menghadap ke luar."
        "\nTari piring ditarikan dengan gerakan-gerakan yang dinamis, lincah, energik dan bahkan terkesan akrobatik karena sering menampilkan gerakan-gerakan yang sulit."
        "\nMengutip dalam buku 'Seni dan Budaya' karya Harry Sulastianto, dkk, gerakan-gerakan yang terdapat dalam Tari Piring antara lain gerak batanam (bertanam), gerak manyabik (menyabit), gerak mengirik (mengirik padi), dan gerak baguliang (berguling)."
        "\nGerakan-gerakan tersebut merupakan gambaran peristiwa kegiatan masyarakat dalam bekerja. Tari piring diiringi oleh musik tradisional yang disebut talempong. Musik talempong terdiri atas enam buah talempong, satu buah gong kecil, satu buah tambua, satu buah botol dan sejenis kerincing.",
    image: "assets/seni/14_sumatera_barat_tari_piring.jpg",
  ),
];
