import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sentra/common/state_enum.dart';
import 'package:sentra/domain/usecases/get_detail.dart';

import '../../../domain/entities/art_detail.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {

   final GetDetailArt getDetailArt;

  DetailBloc({
    required this.getDetailArt,
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
          // message: '',
        ));
      }
      );
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
