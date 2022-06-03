import 'package:dartz/dartz.dart';
import 'package:sentra/domain/entities/art_detail.dart';

import '../../common/failure.dart';
import '../repositories/art_repository.dart';


class SaveFavoriteArts {
  final ArtRepository repository;

  SaveFavoriteArts(this.repository);

  Future<Either<Failure, String>> execute(DetailArt art) {
    return repository.saveFavoriteArts(art);
  }
}