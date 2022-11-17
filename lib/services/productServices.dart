import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/productModels.dart';
import '../utils/myString.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to leod product');
    }
  }
}
