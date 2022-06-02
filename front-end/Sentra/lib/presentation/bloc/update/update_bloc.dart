import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/domain/usecases/get_update.dart';
import 'package:sentra/presentation/bloc/update/update_event.dart';
import 'package:sentra/presentation/bloc/update/update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  final GetUpdate _getUpdate;

  UpdateBloc(this._getUpdate) : super(UpdateEmpty()) {
    on<OnUpdateChanged>((event, emit) async {
      emit(UpdateLoading(),);
      final result = await _getUpdate.execute();

      result.fold(
        (failure) {
          emit(UpdateError(failure.message));
        },
        (data) {
          emit(UpdateHasData(data));
        },
      );
    });
  }
}
