class DocumKesenian {
    DocumKesenian({
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

    factory DocumKesenian.fromJson(Map<String, dynamic> json) => DocumKesenian(
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
}
