import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Future<void> fetchAndSetProducts() async {
    var url =
        Uri.parse('https://api.whitelabelapp.in/v2/product/list/1?format=json');
    try {
      final response = await http.get(url);
      final extractedData = jsonDecode(response.body) as List<dynamic>;
      final List<Product> loadedProducts = [];
      for (var e in extractedData) {
        loadedProducts.add(Product(
            product_number: e["id"],
            images: e["images"],
            category_name: e["category_name"],
            name: e["name"],
            description: e["description"],
            stock_qty: e["stock_qty"],
            price: e["price"],
            discount: e["discount"]));
      }
      _items = loadedProducts;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
