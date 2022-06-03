import 'package:sentra/common/failure.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:dartz/dartz.dart';
import 'package:sentra/domain/entities/art_detail.dart';
import 'package:sentra/domain/usecases/get_detail.dart';

abstract class ArtRepository {
  Future<Either<Failure, List<Art>>> getProvinceList();
  Future<Either<Failure, List<Art>>> getUpdateList();
  Future<Either<Failure, List<Art>>> getArtsList();
  Future<Either<Failure, List<Art>>> searchArt(String query);
  Future<Either<Failure, DetailArt>> getDetailArt(String id);  
  Future<Either<Failure, List<Art>>> getFavoriteArts();
  Future<Either<Failure, String>> saveFavoriteArts(DetailArt art);
  Future<Either<Failure, String>> removeFavoriteArts(DetailArt art);
  Future<bool> getFavoriteStatus(String id);
}