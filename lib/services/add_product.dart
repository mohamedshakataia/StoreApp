import 'package:storeapp/helper/api.dart';
import 'package:storeapp/model/proudect_model.dart';

class AddProduct {
  Future<ProudectModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProudectModel.fromjson(data);
  }
}
