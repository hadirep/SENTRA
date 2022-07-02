import 'package:flutter_test/flutter_test.dart';

// ignore: avoid_relative_lib_imports
import '../lib/data/models/art_and_province_model.dart';

void main() {
  test('Test parsing berhasil', () async {
    var artList = {
      "id_kesenian": "STR2205028",
      "name": "Wayang Kulit",
      "price": "6000000",
      "category": "Teater",
      "community": "Sanggar Seni Wayang Kulit",
      "phone_number": "08958324432",
      "email": "bank_wayangkulit@gmail.com",
      "province": "Jawa Timur",
      "description": "Seni Wayang Kulit telah ditetapkan UNESCO sebagai Warisan"
          "Budaya Tak Benda pertama Indonesia dalam kategori Representative List "
          "of the Intangible Cultural Heritage of Humanity pada tahun 2003. "
          "Wayang kulit adalah kesenian dengan menggunakan bentuk karakter mitologi"
          " yang biasanya dibuat dengan menggunakan lembaran kulit binatang "
          "(kerbau atau sapi) yang dikeringkan. Dimainkan oleh seorang dalang,"
          " wayang kulit membawa cerita-cerita dengan pesan yang berasal dari "
          "kepercayaan dan budaya setempat mengenai budi pekerti luhur, "
          "atau bahkan berupa kritik sosial.,",
      "image": "28_jawa_timur_wayang_kulit.jpg",
      "created_at": "2022-06-01 08:14:30",
      "updated_at": null,
      "is_facebook": "Sanggar Seni Wayang Kulit",
      "is_instagram": "bank_wayangkulit",
      "recommended": null
    };

    var parseArtList = ArtList.fromJson(artList).id;
    expect(parseArtList, "STR2205028");
  });
}