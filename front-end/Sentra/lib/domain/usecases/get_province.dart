import 'package:dartz/dartz.dart';
import 'package:sentra/common/failure.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/domain/repositories/art_repository.dart';

class GetProvince {
  final ArtRepository repository;

  GetProvince(this.repository);

  Future<Either<Failure, List<Art>>> execute() {
    return repository.getProvinceList();
  }
}
