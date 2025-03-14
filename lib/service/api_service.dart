import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shopping/models/product.dart';

class ApiService {
  final String apiUrl = "http://api.kartel.dev/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}