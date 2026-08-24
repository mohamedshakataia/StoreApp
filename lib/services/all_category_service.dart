import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/model/proudect_model.dart';

class AllCategoryService {
  Future<List<dynamic>> getCategory() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}
