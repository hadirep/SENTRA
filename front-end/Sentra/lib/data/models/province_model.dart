class ProvinceModel {
  ProvinceModel({
    required this.error,
    required this.status,
    required this.message,
    required this.data,
  });

  final bool error;
  final String status;
  final String message;
  final ProvinceDetail data;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
    error: json["error"],
    status: json["status"],
    message: json["message"],
    data: ProvinceDetail.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ProvinceDetail {
  ProvinceDetail({
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

  factory ProvinceDetail.fromJson(Map<String, dynamic> json) => ProvinceDetail(
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
