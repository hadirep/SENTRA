import 'package:dartz/dartz.dart';
import 'package:sentra/common/failure.dart';
import 'package:sentra/domain/entities/art_detail.dart';
import 'package:sentra/domain/repositories/art_repository.dart';

class GetDetailArt {
  final ArtRepository repository;

  GetDetailArt(this.repository);

  Future<Either<Failure, DetailArt>> execute(String id) {
    return repository.getDetailArt(id);
  }
}
