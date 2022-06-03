import 'package:dartz/dartz.dart';
import 'package:sentra/domain/entities/art.dart';

import '../../common/failure.dart';
import '../repositories/art_repository.dart';


class GetFavoriteStatus {
  final ArtRepository repository;

  GetFavoriteStatus(this.repository);

  Future<bool> execute(String id) async {
    return repository.getFavoriteStatus(id);
  }
}