import 'package:storeapp/helper/api.dart';
import 'package:storeapp/model/proudect_model.dart';

class UpdateProductget {
  Future<ProudectModel> updateProduct({
    required String title,
    required dynamic price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
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
