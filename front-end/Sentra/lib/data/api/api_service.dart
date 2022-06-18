import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sentra/data/models/art_list_model.dart';
import 'package:sentra/data/models/province_list_model.dart';
import 'package:sentra/data/models/province_query_model.dart';
import 'package:sentra/data/models/detail_model.dart';
import 'package:sentra/data/models/search_art.dart';
import 'package:sentra/data/models/update_list_model.dart';

class ApiService {
  static const String baseUrl = 'https://sentra.dokternak.id/api/';
  static const String baseImageArt = 'https://sentra.dokternak.id/public/kesenians/';
  static const String baseImageDocArt = 'https://sentra.dokternak.id/public/dokumentasiKesenians/';

  Future<ProvinceListModel> getProvinceList() async {
    final response = await http.get(Uri.parse('${baseUrl}province'));

    if(response.statusCode == 200) {
      return ProvinceListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Province Page');
    }
  }

  Future<ProvinceQueryModel> getProvinceQuery(String query) async {
    final response = await http.get(Uri.parse('${baseUrl}province/kesenians?q=$query'));

    if(response.statusCode == 200) {
      return ProvinceQueryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Detail Page');
    }
  }

  Future<DetailModel> getProvinceDetail(String id) async {
    final response = await http
        .get(Uri.parse('${baseUrl}kesenians/$id'));

    if(response.statusCode == 200) {
      return DetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Province Detail');
    }
  }

  Future<UpdateListModel> getUpdateList() async {
    final response = await http
        .get(Uri.parse('${baseUrl}recommended/kesenians'));

    if(response.statusCode == 200) {
      return UpdateListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Province List');
    }
  }

  Future<DetailModel> getUpdateDetail(String id) async {
    final response = await http
        .get(Uri.parse('${baseUrl}kesenians/$id'));

    if(response.statusCode == 200) {
      return DetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Update Detail');
    }
  }

  Future<ArtListModel> getArtList() async {
    final response = await http
        .get(Uri.parse('${baseUrl}kesenians'));

    if(response.statusCode == 200) {
      return ArtListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Art List');
    }
  }

  Future<DetailModel> getArtDetail(String id) async {
    final response = await http
        .get(Uri.parse('${baseUrl}kesenians/$id'));

    if(response.statusCode == 200) {
      return DetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Art Detail');
    }
  }

  Future<ResultArtSearch> getSearchArt(String query) async {
    final response = await http
        .get(Uri.parse('${baseUrl}search/kesenians?q=$query'));
    if (response.statusCode == 200) {
      return ResultArtSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Search');
    }
  }

  Future putArtList(String id, String name, String price, String community,
      String phoneNumber, String email, String province,
      dynamic isFacebook, dynamic isInstagram) async {
    try{
      final response = await http.put(Uri.parse('${baseUrl}kesenians/$id'),
        body: {
          'name': name,
          'price': price,
          'community': community,
          'phone_number': phoneNumber,
          'email': email,
          'province': province,
          'is_facebook': isFacebook,
          'is_instagram': isInstagram
        },
      );

      if(response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteArtList(String id) async {
    try {
    final response = await http.delete(Uri.parse('${baseUrl}kesenians/$id'),
    );      
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
    } catch (e) {
      print(e.toString());
    }
  }
}