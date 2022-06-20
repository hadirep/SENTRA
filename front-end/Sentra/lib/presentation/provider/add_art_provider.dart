import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AddArtProvider extends ChangeNotifier {
  static const String baseUrl = 'https://sentra.dokternak.id/api/';

  Future<bool> storeArt(String name, String price,String category, String community,
      String phoneNumber, String email, String province, String description,
      dynamic isFacebook, dynamic isInstagram) async {
    final url = '';
    final response = await http.post(Uri.parse('${baseUrl}kesenians'),
        body: {
          'name': name,
          'price': price,
          'category': category,
          'community': community,
          'phone_number': phoneNumber,
          'email': email,
          'province': province,
          'description': description,
          'is_facebook': isFacebook,
          'is_instagram': isInstagram,
        });

    final result = json.decode(response.body);
    if(response.statusCode == 201 && result['status'] == 'success') {
      notifyListeners();
      return true;
    }
    return false;
  }
}