import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:sentra/common/exception.dart';
import 'package:sentra/data/models/art_model.dart';
import 'package:sentra/data/models/art_response.dart';

abstract class ArtRemoteDataSource {
  Future<List<ArtModel>> searchArt(String query);
}

class ArtRemoteDataSourceImpl implements ArtRemoteDataSource {
  static const BASE_URL = 'https://sentra.dokternak.id/api/';

  final http.Client client;
  
  ArtRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ArtModel>> searchArt(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/kesenians?q=$query'));

    if (response.statusCode == 200) {
      return ArtResponse.fromJson(json.decode(response.body)).artList;
    } else {
      throw ServerException();
    }
  }
}