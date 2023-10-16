import 'dart:convert';

import 'package:gajetbd/constant/productsclass.dart';
import 'package:http/http.dart';

class ApiIntegration {
  var url = "https://fakestoreapi.com/products";

  Future fetchProducts() async {
    var response = await get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        final List<dynamic> products = jsonDecode(json);

        return products.map((items) => Products.fromJson(items)).toList();
      } else {
        print(response.statusCode);
      }
    } catch (er) {
      print(er.toString());
    }
  }
}
