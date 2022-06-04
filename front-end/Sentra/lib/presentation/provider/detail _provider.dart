import 'package:flutter/material.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/province_model.dart';
import 'package:sentra/common/result_state.dart';

class DetailProvider extends ChangeNotifier {
  final ApiService? detailApiService;
  final String id;

  DetailProvider({required this.detailApiService, required this.id}){
    _fecthDetail(id);
  }

  late ProvinceModel _detail;
  late ResultState _detailState;
  String _detailMessage = '';

  String get detailMessage => _detailMessage;
  ProvinceModel get detail => _detail;
  ResultState get detailState => _detailState;

  Future<dynamic> _fecthDetail(String id) async {
    try {
      _detailState = ResultState.loading;
      notifyListeners();
      final detail = await detailApiService!.getDetail(id);
      if(detail.error){
        _detailState = ResultState.noData;
        notifyListeners();
        return _detailMessage = 'Empty Data';
      } else {
        _detailState = ResultState.hasData;
        notifyListeners();
        return _detail = detail;
      }
    } catch (e) {
      _detailState = ResultState.error;
      notifyListeners();
      return _detailMessage = 'No Internet Connection...';
    }
  }
}