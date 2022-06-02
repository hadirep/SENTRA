part of 'detail_bloc.dart';

@immutable 
abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object?> get props => [];
}

class OnDetailChanged extends DetailEvent {
  final String id;

  const OnDetailChanged(this.id);

  @override
  List<Object?> get props => [id];
}

class OnLoadFavoriteStatus extends DetailEvent {
  final String id;

  const OnLoadFavoriteStatus(this.id);

  @override
  List<Object> get props => [id];
}

class OnAddFavorite extends DetailEvent {
  final DetailArt art;

  const OnAddFavorite(this.art);

  @override
  List<Object?> get props => [art];
}

class OnRemoveFavorite extends DetailEvent {
  final DetailArt art;

  const OnRemoveFavorite(this.art);

  @override
  List<Object?> get props => [art];
}
