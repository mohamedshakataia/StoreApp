import 'package:storeapp/helper/api.dart';
import 'package:storeapp/model/proudect_model.dart';

class AllProuducts {
  Future<List<ProudectModel>> getProductAll() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );
    List<ProudectModel> listproduct = [];
    for (int i = 0; i < data.length; i++) {
      listproduct.add(ProudectModel.fromjson(data[i]));
    }
    print(listproduct);
    return listproduct;
  }
}
