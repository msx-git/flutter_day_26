import 'package:flutter_day_26/models/product.dart';
import 'package:flutter_day_26/services/products_http_service.dart';

class ProductsController {
  final productsHttpService = ProductsHttpService();

  Future<List<Product>> getProducts() async {
    List<Product> products = await productsHttpService.fetchProducts();
    return products;
  }
}
