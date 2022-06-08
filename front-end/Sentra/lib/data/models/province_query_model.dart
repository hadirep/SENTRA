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
    required this.province,
    required this.image,
  });

  final String id;
  final String name;
  final String price;
  final String province;
  final String image;

  factory ProvinceQuery.fromJson(Map<String, dynamic> json) => ProvinceQuery(
    id: json["id_kesenian"],
    name: json["name"],
    price: json["price"],
    province: json["province"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id_kesenian": id,
    "name": name,
    "price": price,
    "province": province,
    "image": image,
  };
}