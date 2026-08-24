import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/model/proudect_model.dart';

class CategoriesService {
  Future<List<ProudectModel>> getProductAll({
    required String categoryname,
  }) async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryname',
    );
    List<ProudectModel> listproduct = [];
    for (int i = 0; i < data.length; i++) {
      listproduct.add(ProudectModel.fromjson(data[i]));
    }
    return listproduct;
  }
}
