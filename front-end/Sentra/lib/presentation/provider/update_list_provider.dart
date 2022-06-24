import 'package:flutter/material.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/update_and_query_model.dart';
import 'package:sentra/common/result_state.dart';

class UpdateListProvider extends ChangeNotifier {
  final ApiService? listApiService;

  UpdateListProvider({required this.listApiService,}){
    _fetchUpdateList();
  }

  late UpdateAndQueryModel _list;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  UpdateAndQueryModel get list => _list;
  ResultState get listState => _state;

  Future<dynamic> _fetchUpdateList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listUpdate = await listApiService!.getUpdateList();
      if (listUpdate.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _list = listUpdate;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection...';
    }
  }
}