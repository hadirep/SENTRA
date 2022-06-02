import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/domain/usecases/get_favorite_arts.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
// import 'package:rxdart/rxdart.dart';


class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteArts _getFavoriteArts;

  FavoriteBloc(this._getFavoriteArts) : super(FavoriteArtEmpty()) {
    on<OnFavoriteChanged>((event, emit) async {
      emit(FavoriteArtLoading());
      final result = await _getFavoriteArts.execute();

      result.fold(
        (failure) {
          emit(FavoriteArtError(failure.message));
        },
        (data) {
          emit(FavoriteArtHasData(data));
        },
      );
    });
  }
}
