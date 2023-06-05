// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:o_store/Model/product.dart';
import 'package:dio/dio.dart';

class DioConnection {
  var dio = Dio();

  //final baseurl = 'https://fakestoreapi.com/';

// this function for get all the market backend items without any filtering.

  static Future<List<Product>> getAllProducts() async {
    Response response = await Dio().get('https://fakestoreapi.com/products');
    return (response.data as List).map((x) => Product.fromJson(x)).toList();
  }

// this function for getting the products for specific category , not all data.

  static Future<List<Product>> getProductsByCategory(
      String cateogtyName) async {
    Response response = await Dio()
        .get('https://fakestoreapi.com/products/category/$cateogtyName');

    return (response.data as List).map((x) => Product.fromJson(x)).toList();
  }

  //this function for get data for specific id not all items.

  static Future<Product> getProductsById(int productId) async {
    Response response =
        await Dio().get('https://fakestoreapi.com/products/$productId');
    Product _product = Product.fromJson(response.data);
    return _product;
  }
}
