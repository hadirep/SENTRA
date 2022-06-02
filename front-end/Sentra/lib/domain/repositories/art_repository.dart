import 'package:sentra/common/failure.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:dartz/dartz.dart';

abstract class ArtRepository {
  Future<Either<Failure, List<Art>>> searchArt(String query);
}