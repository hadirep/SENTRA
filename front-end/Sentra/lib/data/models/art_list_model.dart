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
    required this.province,
    required this.image,
  });

  final String id;
  final String name;
  final String price;
  final String category;
  final String province;
  final String image;

  factory ArtList.fromJson(Map<String, dynamic> json) => ArtList(
    id: json["id_kesenian"],
    name: json["name"],
    price: json["price"],
    category: json["category"],
    province: json["province"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id_kesenian": id,
    "name": name,
    "price": price,
    "category": category,
    "province": province,
    "image": image,
  };
}
