class DetailModel {
  DetailModel({
    required this.status,
    required this.data,
  });

  final String status;
  final Data data;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
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
  final String image;
  final String isFacebook;
  final String isInstagram;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    "is_facebook": isFacebook,
    "is_instagram": isInstagram,
  };
}