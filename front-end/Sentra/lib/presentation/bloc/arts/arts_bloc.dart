import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/domain/usecases/get_arts.dart';
import 'package:sentra/presentation/bloc/arts/arts_event.dart';
import 'package:sentra/presentation/bloc/arts/arts_state.dart';

class ArtsBloc extends Bloc<ArtsEvent, ArtsState> {
  final GetArts _getArts;

  ArtsBloc(this._getArts) : super(ArtsEmpty()) {
    on<OnArtsChanged>((event, emit) async {
      emit(ArtsLoading(),);
      final result = await _getArts.execute();

      result.fold(
            (failure) {
          emit(ArtsError(failure.message));
        },
            (data) {
          emit(ArtsHasData(data));
        },
      );
    });
  }
}
