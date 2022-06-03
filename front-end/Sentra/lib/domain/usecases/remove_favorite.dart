import 'package:dartz/dartz.dart';
import 'package:sentra/domain/entities/art_detail.dart';
import 'package:sentra/common/failure.dart';
import 'package:sentra/domain/repositories/art_repository.dart';

class RemoveFavoriteArts {
  final ArtRepository repository;

  RemoveFavoriteArts(this.repository);

  Future<Either<Failure, String>> execute(DetailArt art) {
    return repository.removeFavoriteArts(art);
  }
}