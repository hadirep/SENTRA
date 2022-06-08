import 'package:flutter/cupertino.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/search_art.dart';

enum ArtState {loading, noData, hasData, error }
class SearchArtProvider extends ChangeNotifier {
  final ApiService searchApiService;

  SearchArtProvider({required this.searchApiService}){
    fetchSearchArt(query);
  }

  ResultArtSearch? _searchArt;
  ArtState? _artState;
  String _message = '';
  String _query = '';


  String get message => _message;
  ResultArtSearch? get searchArt => _searchArt;
  String get query => _query;
  ArtState? get artState => _artState;

  Future<dynamic> fetchSearchArt(String query) async {
    try {
      if (query.isNotEmpty) {
        _artState = ArtState.loading;
        _query = query;
        final searchArt =
        await searchApiService.getSearchArt(query);
        if (searchArt.data.isEmpty) {
          _artState = ArtState.noData;
          notifyListeners();
          return _message = 'Empty Data';
        } else {
          _artState = ArtState.hasData;
          notifyListeners();
          return _searchArt = searchArt;
        }
      }
    } catch (e) {
      _artState = ArtState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
