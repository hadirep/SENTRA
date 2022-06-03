part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
  
  @override
  List<Object?> get props => [];
}

class FavoriteArtEmpty extends FavoriteState {}

class FavoriteArtLoading extends FavoriteState {}

class FavoriteArtError extends FavoriteState {
  final String message;
  const FavoriteArtError(this.message);

  @override 
  List<Object?> get props => [message];
}

class FavoriteArtHasData extends FavoriteState {
  final List<Art> result;
 
  const FavoriteArtHasData(this.result);
 
  @override
  List<Object?> get props => [result];
}



