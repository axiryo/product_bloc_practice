import 'dart:convert';
import 'dart:developer';

import 'package:sprout_technical_exam/core/configs/api_config.dart';
import 'package:sprout_technical_exam/core/error/exception.dart';
import 'package:sprout_technical_exam/models/product/product_detail_model.dart';
import 'package:sprout_technical_exam/models/product/product_list_item_model.dart';

import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductListItem>> fetchProducts(
      {required int productSkip,
      int limit = 10,
      List<String> selectedFields = const [
        'title',
        'price',
        'thumbnail',
        'stock',
        'discountPercentage'
      ]}) async {
    try {
      String selectFields = selectedFields.join(',');
      String url =
          '${ApiConfig.baseProductUrl}?limit=${limit.toString()}&skip=${productSkip.toString()}&select=$selectFields';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result.containsKey("products")) {
          List<dynamic> dynamicProducts = result["products"];
          List<ProductListItem> products = dynamicProducts
              .map((dynamic product) => ProductListItem.fromMap(product))
              .toList();
          return products;
        } else {
          throw Exception('Unexpected response structure');
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load products');
    }
  }

  Future<ProductDetail> fetchProductById(String productId) async {
    try {
      final String url = 'https://dummyjson.com/products/$productId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return ProductDetail.fromMap(jsonResponse);
      } else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load products');
    }
  }
}
