import 'package:equatable/equatable.dart';
import 'package:sentra/domain/entities/art_detail.dart';

class DocumKesenianResponse extends Equatable {
    DocumKesenianResponse({
        required this.id,
        required this.idKesenianImg,
        required this.documentation,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String idKesenianImg;
    String documentation;
    dynamic createdAt;
    dynamic updatedAt;

    // @override 
    // List<Object?> get props => [id, idKesenianImg, documentation, createdAt, updatedAt];

    factory DocumKesenianResponse.fromJson(Map<String, dynamic> json) => DocumKesenianResponse(
        id: json["id"],
        idKesenianImg: json["id_kesenian_img"],
        documentation: json["documentation"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_kesenian_img": idKesenianImg,
        "documentation": documentation,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };

    DocumKesenian toEntity() {
    return DocumKesenian(id: this.id, idKesenianImg: this.idKesenianImg, documentation: this.documentation, createdAt: this.createdAt, updatedAt: this.updatedAt);
  }

    @override 
    List<Object?> get props => [id, idKesenianImg, documentation, createdAt, updatedAt];
}
