class ProvinceListModel {
  ProvinceListModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<ProvinceList> data;

  factory ProvinceListModel.fromJson(Map<String, dynamic> json) => ProvinceListModel(
    status: json["status"],
    data: List<ProvinceList>.from(json["data"]
        .map((x) => ProvinceList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProvinceList {
  ProvinceList({
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

  factory ProvinceList.fromJson(Map<String, dynamic> json) => ProvinceList(
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
