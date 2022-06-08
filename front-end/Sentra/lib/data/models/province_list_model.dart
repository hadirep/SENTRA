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
    required this.province,
    required this.image,
  });

  final String id;
  final String name;
  final String price;
  final String province;
  final String image;

  factory ProvinceList.fromJson(Map<String, dynamic> json) => ProvinceList(
    id: json["id_kesenian"],
    name: json["name"],
    price: json["price"],
    province: json["province"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id_kesenian": id,
    "name": name,
    "price":price,
    "province": province,
    "image": image,
  };
}
