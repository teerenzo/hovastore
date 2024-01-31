import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/productModel.dart';

class ApiService {
  final String baseUrl =
      'https://65b5f925da3a3c16ab0013d1.mockapi.io/api/v1/products';

  Future<List<Product>> getProducts() async {
    Response res = await get(Uri.parse(baseUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();

      return products;
    } else {
      throw "Can't get products.";
    }
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
