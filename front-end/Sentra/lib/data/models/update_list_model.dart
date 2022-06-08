class UpdateListModel {
  UpdateListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<UpdateList> data;

  factory UpdateListModel.fromJson(Map<String, dynamic> json) =>
      UpdateListModel(
    status: json["status"],
    message: json["message"],
    data: List<UpdateList>.from(json["data"]
        .map((x) => UpdateList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UpdateList {
  UpdateList({
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

  factory UpdateList.fromJson(Map<String, dynamic> json) => UpdateList(
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
