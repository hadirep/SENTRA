import 'package:flutter/material.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:common/result_state.dart';

class ArtListProvider extends ChangeNotifier {
  final ApiService? listApiService;

  ArtListProvider({required this.listApiService}){
    fetchListProvince();
  }

  late ArtAndProvinceModel _list;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  ArtAndProvinceModel get list => _list;
  ResultState get listState => _state;

    Future<dynamic> fetchListProvince() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listArt = await listApiService!.getArtList();
      if (listArt.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _list = listArt;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection...';
    }
  }
}