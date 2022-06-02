import 'package:equatable/equatable.dart';
import 'package:sentra/domain/entities/art.dart';

class ArtModel extends Equatable {
  final String idArt;
  final String name;
  final int? price;
  final String? category;
  final String community;
  final String? phone;
  final String? email;
  final String province;
  final String description;
  final String? image;
  final String? isFacebook;
  final String? isInstagram;


  const ArtModel({
    required this.idArt,
    required this.name,
    required this.price,
    required this.category,
    required this.community,
    required this.phone,
    required this.email,
    required this.province,
    required this.description,
    required this.image,
    required this.isFacebook,
    required this.isInstagram,
  });

  factory  ArtModel.fromJson(Map<String, dynamic> json) => ArtModel(
      idArt: json["id_kesenian"],
      name: json["name"],
      price: json["price"],
      category: json["category"],
      community: json["community"],
      phone: json["phone_number"],
      email: json["email"],
      province: json["province"],
      description: json["description"],
      image: json["image"],
      isFacebook: json["is_facebook"],
      isInstagram: json["is_instagram"],
  );

  Map<String, dynamic> toJson() => {
    "id_kesenian": idArt,
    "name" : name,
    "price": price,
    "category": category,
    "community": community,
    "phone_number": phone,
    "email": email,
    "province": province,
    "description": description,
    "image": image,
    "is_facebook": isFacebook,
    "is_instagram": isInstagram,
  };

  Art toEntity() {
    return Art(
        idArt: idArt,
        name: name,
        price: price,
        category: category,
        community: community,
        phone: phone,
        email: email,
        province: province,
        description: description,
        image: image,
        isFacebook: isFacebook,
        isInstagram: isInstagram,
    );
  }

  @override
  List<Object?> get props => [
    idArt,
    name,
    price,
    category,
    community,
    phone,
    email,
    province,
    description,
    image,
    isFacebook,
    isInstagram,
  ];
}