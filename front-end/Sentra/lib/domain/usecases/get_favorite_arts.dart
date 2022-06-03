import 'package:dartz/dartz.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/common/failure.dart';
import 'package:sentra/domain/repositories/art_repository.dart';

class GetFavoriteArts {
  final ArtRepository _repository;

  GetFavoriteArts(this._repository);

  Future<Either<Failure, List<Art>>> execute() {
    return _repository.getFavoriteArts();
  }
}