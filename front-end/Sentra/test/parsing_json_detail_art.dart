import 'package:flutter_test/flutter_test.dart';

import '../lib/data/models/detail_model.dart';

void main() {
  test('Test parsing berhasil', () async {
    var artDetail = {
      "id_kesenian": "STR2205029",
      "name": "Pencak Silat",
      "price": "150000",
      "category": "Pencak Silat",
      "community": "Pencak Silat Indonesiaa",
      "phone_number": "08571135792",
      "email": "pencaksilat@gmail.com",
      "province": "Sumatera Barat",
      "description": "Sejarah pencak silat Indonesia sudah hadir semenjak abad ke-7. Pencak silat bermula dari perkembangan keterampilan suku asli Indonesia dalam berburu dan perang dengan menggunakan alat perang seperti parang, perisai, dan tombak. Catatan mengenai sejarah pencak silat terdokumentasikan dalam berbagai artefak senjata yang ditemukan pada peninggalan Hindu Budha seperti pahatan relief-relief yang menggambarkan sikap kuda-kuda silat di Candi Prambanan dan Borobudur. \n\nAjaran Islam juga ikut menggoreskan catatan mengenai sejarah pencak silat yang dimulai pada abad ke 14 di Nusantara oleh kaum penyebar ajaran Islam, dan diajarkan di pesantren sebagai bagian dari latihan spiritual. \n\nBanyak tokoh yang ikut berkecimpung dalam proses pengembangan dan mewarnai sejarah pencak silat. Seperti: Panembahan Senopati, Sultan Agung, Pangeran Diponegoro, Teungku Chik di Tiro, Teuku Umar, Tuanku Imam Bonjol, serta para pendekar wanita, seperti Sabai Nan Aluih, Cut Nyak Dhien, dan Cut Nyak Meutia. \n\nBanyaknya tokoh Islam yang mengembangkan pencak silat karena catatan sejarah pencak silat banyak diwarnai di kaum penyebar agama Islam pada abad ke-14 di Nusantara. Kala itu pencak silat diajarkan bersama-sama dengan pelajaran agama di surau atau pesantren. Silat menjadi bagian dari latihan spiritual.",
      "image": "29_jawa_barat_pencak_silat.jpg",
      "created_at": "2022-06-01T08:14:30.000000Z",
      "updated_at": null,
      "is_facebook": "pencak silat",
      "is_instagram": "pencak_silat",
      "recommended": null,
      "documKesenians": [
        {
          "id": 4,
          "id_kesenian_img": "STR2205029",
          "documentation": "pencaksilat1.jpg",
          "created_at": null,
          "updated_at": null
        },
        {
          "id": 5,
          "id_kesenian_img": "STR2205029",
          "documentation": "pencaksilat2.jpg",
          "created_at": null,
          "updated_at": null
        },
        {
          "id": 6,
          "id_kesenian_img": "STR2205029",
          "documentation": "pencaksilat3.jpg",
          "created_at": null,
          "updated_at": null
        }
      ]
    };

    var parseArtDetail = Data.fromJson(artDetail).id;
    expect(parseArtDetail, "STR2205029");
  });
}