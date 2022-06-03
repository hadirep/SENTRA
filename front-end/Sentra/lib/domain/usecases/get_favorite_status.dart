import 'package:sentra/domain/repositories/art_repository.dart';

class GetFavoriteStatus {
  final ArtRepository repository;

  GetFavoriteStatus(this.repository);

  Future<bool> execute(String id) async {
    return repository.getFavoriteStatus(id);
  }
}