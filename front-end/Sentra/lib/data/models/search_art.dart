import 'package:sentra/data/models/art_and_province_model.dart';

class ResultArtSearch {
  ResultArtSearch({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<ArtList> data;

  factory ResultArtSearch.fromJson(Map<String, dynamic> json) =>
      ResultArtSearch(
        status: json["status"],
        message: json["message"],
        data: List<ArtList>.from(
            json["data"].map((x) => ArtList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}