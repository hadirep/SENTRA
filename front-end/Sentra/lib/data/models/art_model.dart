import 'package:equatable/equatable.dart';
import 'package:sentra/domain/entities/art.dart';

class ArtModel extends Equatable {
  ArtModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.community,
    required this.phoneNumber,
    required this.email,
    required this.province,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.isFacebook,
    required this.isInstagram,
  });

  final String id;
  final String name;
  final String price;
  final String category;
  final String community;
  final String phoneNumber;
  final String email;
  final String province;
  final String description;
  final String? image;
  final DateTime createdAt;
  final dynamic updatedAt;
  final String isFacebook;
  final String isInstagram;

  factory ArtModel.fromJson(Map<String, dynamic> json) => ArtModel(
    id: json["id_kesenian"],
    name: json["name"],
    price: json["price"],
    category: json["category"],
    community: json["community"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    province: json["province"],
    description: json["description"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    isFacebook: json["is_facebook"],
    isInstagram: json["is_instagram"],
  );

  Map<String, dynamic> toJson() => {
    "id_kesenian": id,
    "name": name,
    "price": price,
    "category": category,
    "community": community,
    "phone_number": phoneNumber,
    "email": email,
    "province": province,
    "description": description,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "is_facebook": isFacebook,
    "is_instagram": isInstagram,
  };

  Art toEntity() {
    return Art(
      id: id,
      name: this.name,
      price: this.price,
      category: this.category,
      community: this.community,
      phoneNumber: this.phoneNumber,
      email: this.email,
      province: this.province,
      description: this.description,
      image: this.image,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      isFacebook: this.isFacebook,
      isInstagram: this.isInstagram,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    price,
    category,
    community,
    phoneNumber,
    email,
    province,
    description,
    image,
    createdAt,
    updatedAt,
    isFacebook,
    isInstagram,
  ];
}