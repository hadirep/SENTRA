import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sentra/common/state_enum.dart';
import 'package:sentra/domain/usecases/get_detail.dart';
import 'package:sentra/domain/usecases/get_favorite_status.dart';
import 'package:sentra/domain/usecases/remove_favorite.dart';
import 'package:sentra/domain/usecases/save_favorite.dart';

import '../../../domain/entities/art_detail.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  static const addedFavorite = 'Is Added to Favorite';  
  static const removedFavorite = 'Is Removed from Favorite';

   final GetDetailArt getDetailArt;
   final SaveFavoriteArts saveFavoriteArts;
   final RemoveFavoriteArts removeFavoriteArts;
   final GetFavoriteStatus getFavoriteStatusArt;

  DetailBloc({
    required this.getDetailArt,
    required this.saveFavoriteArts,
    required this.removeFavoriteArts,
    required this.getFavoriteStatusArt,
  }) : super(DetailState.initial()) {
    on<OnDetailChanged>((event, emit) async {
      emit(state.copyWith(detailArtState: RequestState.Loading));

      final detailResult = await getDetailArt.execute(event.id);

      detailResult.fold((failure) {
        emit(state.copyWith(detailArtState: RequestState.Error));
      }, (detailData) {
        emit(state.copyWith(
          detailArtState : RequestState.Loaded,
          detailArt : detailData,
          message: '',
        ));
      }
      );
    });

    on<OnAddFavorite>((event, emit) async {
      final result = await saveFavoriteArts.execute(event.art);

      result.fold(
        (failure) {
          emit(state.copyWith(favoritemessage: failure.message));
      },
      (succesmessage) {
        emit(state.copyWith(favoritemessage: succesmessage));
      },
      );

      add(OnLoadFavoriteStatus(event.art.id));
    });

      on<OnRemoveFavorite>((event, emit) async {
      final result = await removeFavoriteArts.execute(event.art);

      result.fold(
        (failure) {
          emit(state.copyWith(favoritemessage: failure.message));
        },
        (succesmessage) {
          emit(state.copyWith(favoritemessage: succesmessage));
        },
      );

      add(OnLoadFavoriteStatus(event.art.id));
    });

    on<OnLoadFavoriteStatus>((event, emit) async {
      final result = await getFavoriteStatusArt.execute(event.id);
      emit(state.copyWith(getFavoriteStatus: result));
    });
  }



  // DetailBloc(this.getDetailArt) : super(DetailInitial()) {
  //   on<OnDetailChanged>((event, emit) async {
  //     // TODO: implement event handler
  //           emit(DetailLoading(),);
  //     final result = await getDetailArt.execute(id);

  //     result.fold(
  //           (failure) {
  //         emit(DetailError(failure.message));
  //       },
  //           (data) {
  //         emit(DetailHasData(data));
  //       },
  //     );
  //   });
  // }
}
