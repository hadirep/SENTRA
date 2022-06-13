class ArtListModel {
  ArtListModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<ArtList> data;

  factory ArtListModel.fromJson(Map<String, dynamic> json) => ArtListModel(
    status: json["status"],
    data: List<ArtList>.from(json["data"]
        .map((x) => ArtList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ArtList {
  ArtList({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.community,
    required this.phoneNumber,
    required this.email,
    required this.province,
    required this.image,
    required this.isFacebook,
    required this.isInstagram,
  });

  String id;
  String? name;
  String? price;
  String? category;
  String? community;
  String? phoneNumber;
  String? email;
  String? province;
  String image;
  dynamic isFacebook;
  dynamic isInstagram;

  factory ArtList.fromJson(Map<String, dynamic> json) => ArtList(
    id: json["id_kesenian"],
    name: json["name"],
    price: json["price"],
    category: json["category"],
    community: json["community"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    province: json["province"],
    image: json["image"],
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
    "image": image,
    "is_facebook": isFacebook,
    "is_instagram": isInstagram
  };
}
