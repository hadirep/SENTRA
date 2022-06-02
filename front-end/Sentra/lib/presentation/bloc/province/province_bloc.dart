import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/domain/usecases/get_province.dart';
import 'package:sentra/presentation/bloc/province/province_event.dart';
import 'package:sentra/presentation/bloc/province/province_state.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final GetProvince _getProvince;

  ProvinceBloc(this._getProvince) : super(ProvinceEmpty()) {
    on<OnProvinceChanged>((event, emit) async {
      emit(ProvinceLoading(),);
      final result = await _getProvince.execute();

      result.fold(
        (failure) {
          emit(ProvinceError(failure.message));
        },
        (data) {
          emit(ProvinceHasData(data));
        },
      );
    });
  }
}
