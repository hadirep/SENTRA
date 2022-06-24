import 'package:sentra/data/models/art_and_province_model.dart';

class UpdateAndQueryModel {
  UpdateAndQueryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<ArtList> data;

  factory UpdateAndQueryModel.fromJson(Map<String, dynamic> json) =>
      UpdateAndQueryModel(
    status: json["status"],
    message: json["message"],
    data: List<ArtList>.from(json["data"]
        .map((x) => ArtList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
