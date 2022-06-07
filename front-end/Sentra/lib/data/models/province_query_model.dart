class ProvinceQueryModel {
  ProvinceQueryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  List<ProvinceQuery> data;

  factory ProvinceQueryModel.fromJson(Map<String, dynamic> json) => ProvinceQueryModel(
    status: json["status"],
    message: json["message"],
    data: List<ProvinceQuery>.from(json["data"]
        .map((x) => ProvinceQuery.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProvinceQuery {
  ProvinceQuery({
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
    required this.recommended,
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
  final DateTime createdAt;
  final dynamic updatedAt;
  final String isFacebook;
  final String isInstagram;
  final String recommended;

  factory ProvinceQuery.fromJson(Map<String, dynamic> json) => ProvinceQuery(
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
    recommended: json["recommended"],
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
    "recommended": recommended,
  };
}