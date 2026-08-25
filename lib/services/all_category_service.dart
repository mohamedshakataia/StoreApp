import 'package:storeapp/helper/api.dart';

class AllCategoryService {
  Future<List<dynamic>> getCategory() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}
