import 'package:flutter/material.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/detail_model.dart';
import 'package:sentra/common/result_state.dart';

class UpdateDetailProvider extends ChangeNotifier {
  final ApiService? detailApiService;
  final String id;

  UpdateDetailProvider({required this.detailApiService, required this.id}){
    _fecthUpdateDetail(id);
  }

  late DetailModel _detail;
  late ResultState _detailState;
  String _message = '';

  String get message => _message;
  DetailModel get detail => _detail;
  ResultState get detailState => _detailState;

  Future<dynamic> _fecthUpdateDetail(String id) async {
    try {
      _detailState = ResultState.loading;
      notifyListeners();
      final detail = await detailApiService!.getUpdateDetail(id);
      if(detail == false){
        _detailState = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _detailState = ResultState.hasData;
        notifyListeners();
        return _detail = detail;
      }
    } catch (e) {
      _detailState = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection...';
    }
  }
}