import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sentra/data/models/province_model.dart';

class ApiService {
  static const String baseUrl = 'http://sentra.dokternak.id/api';
  static const String province = '/province/kesenians?q=';
  static const String detail = '/kesenians/';

  Future<ProvinceModel> getProvince(String query) async {
    final response = await http
        .get(Uri.parse(baseUrl + query));

    if(response.statusCode == 200) {
      return ProvinceModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Province Page');
    }
  }

  Future<ProvinceModel> getDetail(String id) async {
    final response = await http
        .get(Uri.parse(baseUrl + detail));

    if(response.statusCode == 200) {
      return ProvinceModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Detail Page');
    }
  }
}
