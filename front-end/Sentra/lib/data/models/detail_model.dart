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
    required this.phone_number,
    required this.email,
    required this.province,
    required this.description,
    required this.image,
    required this.is_facebook,
    required this.is_instagram,
  });

  final String id;
  final String name;
  final String price;
  final String category;
  final String community;
  final String phone_number;
  final String email;
  final String province;
  final String description;
  final String image;
  final String is_facebook;
  final String is_instagram;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id_kesenian"],
    name: json["name"],
    price: json["price"],
    category: json["category"],
    community: json["community"],
    phone_number: json["phone_number"],
    email: json["email"],
    province: json["province"],
    description: json["description"],
    image: json["image"],
    is_facebook: json["is_facebook"],
    is_instagram: json["is_instagram"],
  );

  Map<String, dynamic> toJson() => {
    "id_kesenian": id,
    "name": name,
    "price": price,
    "category": category,
    "community": community,
    "phone_number": phone_number,
    "email": email,
    "province": province,
    "description": description,
    "image": image,
    "is_facebook": is_facebook,
    "is_instagram": is_instagram,
  };
}