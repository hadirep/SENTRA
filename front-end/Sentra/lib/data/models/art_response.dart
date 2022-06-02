import 'package:equatable/equatable.dart';
import 'package:sentra/data/models/art_model.dart';

class ArtResponse extends Equatable {
  final List<ArtModel> artList;

  const ArtResponse({required this.artList});

  factory ArtResponse.fromJson(Map<String, dynamic> json) => ArtResponse(
    artList: List<ArtModel>.from((json["data"] as List)
        .map((x) => ArtModel.fromJson(x))
        .where((element) => element.image != null)),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(artList.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [artList];
}