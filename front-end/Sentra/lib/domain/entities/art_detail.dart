import 'package:equatable/equatable.dart';

class DetailArt extends Equatable {
    DetailArt({
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
        createdAt,
        updatedAt,
        isFacebook,
        isInstagram,
    ];
}

class DocumKesenian {
    DocumKesenian({
        required this.id,
        required this.idKesenianImg,
        required this.documentation,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String idKesenianImg;
    String documentation;
    dynamic createdAt;
    dynamic updatedAt;

    factory DocumKesenian.fromJson(Map<String, dynamic> json) => DocumKesenian(
        id: json["id"],
        idKesenianImg: json["id_kesenian_img"],
        documentation: json["documentation"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_kesenian_img": idKesenianImg,
        "documentation": documentation,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
