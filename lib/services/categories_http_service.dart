import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/categoriy.dart';

class CategoriesHttpService {
  Future<List<Categoriy>> fetchCategories() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final List<Categoriy> loadedCategories = [];
    if (data != null) {
      for (var category in data) {
        loadedCategories.add(Categoriy.fromJson(category));
      }
    }
    return loadedCategories;
  }
}
