import 'package:flutter_day_26/models/categoriy.dart';
import 'package:flutter_day_26/services/categories_http_service.dart';

class CategoriesController {
  final categoriesHttpService = CategoriesHttpService();

  Future<List<Categoriy>> getCategories() async {
    return await categoriesHttpService.fetchCategories();
  }
}
