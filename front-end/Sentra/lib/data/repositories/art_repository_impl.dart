import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:sentra/common/exception.dart';
import 'package:sentra/common/failure.dart';
import 'package:sentra/data/datasources/art_local_data_source.dart';
import 'package:sentra/data/datasources/art_remote_data_source.dart';
import 'package:sentra/data/models/art_table.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/domain/repositories/art_repository.dart';
import 'package:sentra/domain/usecases/get_favorite_arts.dart';
import 'package:sentra/domain/usecases/get_favorite_status.dart';
import 'package:sentra/domain/usecases/remove_favorite.dart';
import 'package:sentra/domain/entities/art_detail.dart';

class  ArtRepositoryImpl implements ArtRepository{
  final ArtRemoteDataSource remoteDataSource;
  final ArtLocalDataSource localDataSource;

  ArtRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Art>>> searchArt(String query) async {
    try {
      final result = await remoteDataSource.searchArt(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on TlsException {
      return const Left(CommonFailure('Certificate not valid'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Art>>> getUpdateList() async {
    try {
      final result = await remoteDataSource.getUpdateList();
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ServerFailure(''));
    } catch (e) {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Art>>> getArtsList() async {
    try {
      final result = await remoteDataSource.getArtsList();
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ServerFailure(''));
    } catch (e) {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, DetailArt>> getDetailArt(String id) async {
    try {
      final result = await remoteDataSource.getDetailArt(id);
      return Right(result.toEntity());
    } on SocketException {
      return const Left(ServerFailure(''));
    } catch (e) {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

    @override
  Future<Either<Failure, String>> saveFavoriteArts(DetailArt art) async {
    try {
      final result =
          await localDataSource.insertFavorite(ArtTable.fromEntity(art));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> removeFavoriteArts(DetailArt art) async {
    try {
      final result =
          await localDataSource.removeFavoriteArts(ArtTable.fromEntity(art));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> getFavoriteStatus(String id) async {
    final result = await localDataSource.getArtById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<Art>>> getFavoriteArts() async {
    final result = await localDataSource.getFavoriteArts();
    return Right(result.map((data) => data.toEntity()).toList());
  }

}