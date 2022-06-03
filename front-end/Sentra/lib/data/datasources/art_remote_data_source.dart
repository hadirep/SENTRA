import 'dart:convert';
import 'package:sentra/common/exception.dart';
import 'package:sentra/data/models/art_model.dart';
import 'package:sentra/data/models/art_response.dart';
import 'package:http/http.dart' as http;
import 'package:sentra/data/models/detail_art.dart';

abstract class ArtRemoteDataSource {
  Future<List<ArtModel>> getProvinceList();
  Future<List<ArtModel>> getUpdateList();
  Future<List<ArtModel>> getArtsList();
  Future<List<ArtModel>> searchArt(String query);
  Future<DetailArtResponse> getDetailArt(String id);
}

class ArtRemoteDataSourceImpl implements ArtRemoteDataSource {
  static const baseUrl = 'https://sentra.dokternak.id/api';
  final http.Client client;
  
  ArtRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ArtModel>> searchArt(String query) async {
    final response = await client
        .get(Uri.parse('$baseUrl/search/kesenians?q=$query'));

    if (response.statusCode == 200) {
      return ArtResponse.fromJson(json.decode(response.body)).artList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ArtModel>> getProvinceList() async {
    final response = await client.get(Uri.parse('$baseUrl/kesenians'));

    if (response.statusCode == 200) {
      return ArtResponse.fromJson(json.decode(response.body)).artList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ArtModel>> getUpdateList() async {
    final response = await client
        .get(Uri.parse('$baseUrl/kesenians'));

    if (response.statusCode == 200) {
      return ArtResponse.fromJson(json.decode(response.body)).artList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ArtModel>> getArtsList() async {
    final response = await client
        .get(Uri.parse('$baseUrl/kesenians'));

    if (response.statusCode == 200) {
      return ArtResponse.fromJson(json.decode(response.body)).artList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailArtResponse> getDetailArt(String id) async {
    final response = await client
        .get(Uri.parse('$baseUrl/kesenians'));

    if (response.statusCode == 200) {
      return DetailArtResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

}