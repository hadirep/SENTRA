import 'package:flutter/material.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/province_list_model.dart';
import 'package:sentra/common/result_state.dart';

class ProvinceListProvider extends ChangeNotifier {
  final ApiService? listApiService;

  ProvinceListProvider({required this.listApiService,}){
    _fetchListProvince();
  }

  late ProvinceListModel _list;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  ProvinceListModel get list => _list;
  ResultState get listState => _state;

  Future<dynamic> _fetchListProvince() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listProv = await listApiService!.getProvinceList();
      if (listProv.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _list = listProv;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection...';
    }
  }
}