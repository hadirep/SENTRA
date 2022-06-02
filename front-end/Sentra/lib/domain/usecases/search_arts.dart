import 'package:dartz/dartz.dart';
import 'package:sentra/common/failure.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/domain/repositories/art_repository.dart';

class SearchArt {
  final ArtRepository repository;

  SearchArt(this.repository);

  Future<Either<Failure, List<Art>>> execute(String query) {
    return repository.searchArt(query);
  }
}