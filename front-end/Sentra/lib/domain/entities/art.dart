import 'package:equatable/equatable.dart';

class Art extends Equatable {
  Art({
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

  Art.watchlist({
    required this.id,
    required this.name,
    required this.province,
    required this.image,
  });

  String? id;
  String name;
  String? price;
  String? category;
  String? community;
  String? phoneNumber;
  String? email;
  String? province;
  String? description;
  String? image;
  DateTime? createdAt;
  dynamic? updatedAt;
  String? isFacebook;
  String? isInstagram;

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