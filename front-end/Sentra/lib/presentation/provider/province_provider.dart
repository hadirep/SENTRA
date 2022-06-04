import 'package:flutter/material.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/province_model.dart';
import 'package:sentra/common/result_state.dart';

class ProvinceProvider extends ChangeNotifier {
  final ApiService? provinceApiService;
  final String query;

  ProvinceProvider({required this.provinceApiService, required this.query}){
    _fetchProvince(query);
  }

  late ProvinceModel _detail;
  late ResultState _provinceState;
  String _message = '';

  String get message => _message;
  ProvinceModel get detail => _detail;
  ResultState get provinceState => _provinceState;

  Future<dynamic> _fetchProvince(String query) async {
    try {
      _provinceState = ResultState.loading;
      notifyListeners();
      final detail = await provinceApiService!.getProvince(query);
      if(detail.error){
        _provinceState = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _provinceState = ResultState.hasData;
        notifyListeners();
        return _detail = detail;
      }
    } catch (e) {
      _provinceState = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection...';
    }
  }
}