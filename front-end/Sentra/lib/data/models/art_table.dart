import 'package:equatable/equatable.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/domain/entities/art_detail.dart';

class ArtTable extends Equatable {
  final String? id;
  final String name;
  final String? province;
  final String? image;

  ArtTable({
    required this.id,
    required this.name,
    required this.province,
    required this.image,
  });

  factory ArtTable.fromEntity(DetailArt art) => ArtTable(
    id: art.id,
    name: art.name,
    province: art.province,
    image: art.image,
  );

  factory ArtTable.fromMap(Map<String, dynamic> map) => ArtTable(
    id: map['id'],
    name: map['name'],
    province: map['province'],
    image: map['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'province': province,
    'image': image,
  };

  Art toEntity() => Art.favorite(
    id: id,
    province: province,
    image: image,
    name: name,
  );

  @override
  List<Object?> get props => [id, name, province, image];
}