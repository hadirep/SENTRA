import 'package:flutter/material.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/update_and_query_model.dart';
import 'package:common/result_state.dart';

class ProvinceQueryProvider extends ChangeNotifier {
  final ApiService? queryApiService;
  final String query;

  ProvinceQueryProvider({required this.queryApiService, required this.query}) {
    _fetchProvinceQuery(query);
  }

  late UpdateAndQueryModel _queryDetail;
  late ResultState _queryState;
  String _message = '';

  String get message => _message;
  UpdateAndQueryModel get queryDetail => _queryDetail;
  ResultState get queryState => _queryState;

  Future<dynamic> _fetchProvinceQuery(String query) async {
    try {
      _queryState = ResultState.loading;
      notifyListeners();
      final detailQuery = await queryApiService!.getProvinceQuery(query);
      if (detailQuery.data.isEmpty) {
        _queryState = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _queryState = ResultState.hasData;
        notifyListeners();
        return _queryDetail = detailQuery;
      }
    } catch (e) {
      _queryState = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection...';
    }
  }
}
