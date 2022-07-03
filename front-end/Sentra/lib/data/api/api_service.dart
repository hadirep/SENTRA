import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/data/models/update_and_query_model.dart';
import 'package:sentra/data/models/detail_model.dart';
import 'package:sentra/data/models/search_art.dart';

class ApiService {
  static const String baseUrl = 'https://sentra.dokternak.id/api/';

  Future<ArtAndProvinceModel> getProvinceList() async {
    final response = await http.get(Uri.parse('${baseUrl}province'));

    if (response.statusCode == 200) {
      return ArtAndProvinceModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Province Page');
    }
  }

  Future<UpdateAndQueryModel> getProvinceQuery(String query) async {
    final response =
        await http.get(Uri.parse('${baseUrl}province/kesenians?q=$query'));

    if (response.statusCode == 200) {
      return UpdateAndQueryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Detail Page');
    }
  }

  Future<UpdateAndQueryModel> getUpdateList() async {
    final response =
        await http.get(Uri.parse('${baseUrl}recommended/kesenians'));

    if (response.statusCode == 200) {
      return UpdateAndQueryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Province List');
    }
  }

  Future<ArtAndProvinceModel> getArtList() async {
    final response = await http.get(Uri.parse('${baseUrl}kesenians'));

    if (response.statusCode == 200) {
      return ArtAndProvinceModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Art List');
    }
  }

  Future<ResultArtSearch> getSearchArt(String query) async {
    final response =
        await http.get(Uri.parse('${baseUrl}search/kesenians?q=$query'));
    if (response.statusCode == 200) {
      return ResultArtSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Search');
    }
  }

  Future<DetailModel> getDetail(String id) async {
    final response = await http.get(Uri.parse('${baseUrl}kesenians/$id'));

    if (response.statusCode == 200) {
      return DetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Province Detail');
    }
  }

  Future addArtList(
      String name,
      String price,
      String community,
      String phoneNumber,
      String email,
      String province,
      String description,
      dynamic isFacebook,
      dynamic isInstagram) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}kesenians'),
        body: {
          'name': name,
          'price': price,
          'community': community,
          'phone_number': phoneNumber,
          'email': email,
          'province': province,
          'description': description,
          'is_facebook': isFacebook,
          'is_instagram': isInstagram
        },
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Add data success");
        }
        return true;
      } else {
        if (kDebugMode) {
          print("Add data failed");
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future putArtList(
      String id,
      String name,
      String price,
      String community,
      String category,
      String phoneNumber,
      String email,
      String province,
      String description,
      dynamic isFacebook,
      dynamic isInstagram) async {
    try {
      final response = await http.put(
        Uri.parse('${baseUrl}kesenians/$id'),
        body: {
          'name': name,
          'price': price,
          'community': community,
          'category': category,
          'phone_number': phoneNumber,
          'email': email,
          'province': province,
          'description': description,
          'is_facebook': isFacebook,
          'is_instagram': isInstagram
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future deleteArtList(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('${baseUrl}kesenians/$id'),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
