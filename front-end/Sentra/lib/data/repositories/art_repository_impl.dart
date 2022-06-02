import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:sentra/common/exception.dart';
import 'package:sentra/common/failure.dart';
import 'package:sentra/data/datasources/art_remote_data_source.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/domain/repositories/art_repository.dart';

class  ArtRepositoryImpl implements ArtRepository{
  final ArtRemoteDataSource remoteDataSource;

  ArtRepositoryImpl({
    required this.remoteDataSource,
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
  Future<Either<Failure, List<Art>>> getProvinceList(String query) async {
    try {
      final result = await remoteDataSource.getProvinceList(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ServerFailure(''));
    } catch (e) {
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
}