import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Art extends Equatable{
  String? idArt;
  String? name;
  int? price;
  String? category;
  String? community;
  String? phone;
  String? email;
  String? province;
  String? description;
  String? image;
  String? isFacebook;
  String? isInstagram;

  Art({
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

  Art.showList({
    required this.idArt,
    required this.image,
    required this.name,
    required this.province,
    required this.price,
    required this.community,
  });

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