import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductsHttpService {
  Future<List<Product>> fetchProducts() async {
    Uri url = Uri.parse(
        "https://flutter-day-26-default-rtdb.firebaseio.com/products.json");

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final List<Product> loadedProducts = [];
    if (data != null) {
      data.forEach((key, value) {
        loadedProducts.add(Product.fromJson(value));
      });
    }
    return loadedProducts;
  }
}
