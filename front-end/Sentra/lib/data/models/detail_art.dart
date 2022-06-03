import 'package:equatable/equatable.dart';
import 'dart:convert';

import '../../domain/entities/art_detail.dart';

//idKesenian ganti jadi id
class DetailArtResponse extends Equatable {
    DetailArtResponse({
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
        // required this.documKesenians,
    });

    String id;
    String name;
    String price;
    String category;
    String community;
    String phoneNumber;
    String email;
    String province;
    String description;
    String image;
    DateTime createdAt;
    dynamic updatedAt;
    String isFacebook;
    String isInstagram;
    // List<DocumKesenian> documKesenians;

    factory DetailArtResponse.fromJson(Map<String, dynamic> json) => DetailArtResponse(
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
        // documKesenians: List<DocumKesenian>.from(json["documKesenians"].map((x) => DocumKesenian.fromJson(x))),
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "is_facebook": isFacebook,
        "is_instagram": isInstagram,
        // "documKesenians": List<dynamic>.from(documKesenians.map((x) => x.toJson())),
    };

     DetailArt toEntity() {
      return DetailArt(
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
      // documKesenians: this.documKesenians.map((documentation) => documentation.toEntity()).toList(),
      // documKesenians: this.documKesenians.map((documentation) => documentation.toEntity()).toList(),
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
    //  documKesenians,
    ];
}

