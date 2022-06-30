import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AddArtProvider extends ChangeNotifier {
  var baseUrl = Uri.parse('https://sentra.dokternak.id/api/kesenians');

  Future<bool> storeArt(String name, String price,String category, String community,
      String phoneNumber, String email, String province, String description,
      dynamic isFacebook, dynamic isInstagram, dynamic stream, dynamic length) async {

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = http.MultipartRequest('POST', baseUrl);

    request.fields['name'] = name ;
    request.fields['price'] = price ;
    request.fields['category'] = category ;
    request.fields['community'] = community ;
    request.fields['phone_number'] = phoneNumber ;
    request.fields['email'] = email ;
    request.fields['province'] = province ;
    request.fields['description'] = description ;
    request.fields['is_facebook'] = isFacebook ;
    request.fields['is_instagram'] = isInstagram ;

    var multiport = http.MultipartFile(
        'image',
        stream,
        length);

    request.files.add(multiport);

    var response = await request.send() ;

    print(response.stream.toString());
    if(response.statusCode == 201){
      notifyListeners();
      return true;
      print('image uploaded');
    }else {
      print('failed');
      return false;
    }
  }
}