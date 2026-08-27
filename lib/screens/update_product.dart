import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/model/proudect_model.dart';
import 'package:storeapp/services/update_product.dart';

import 'package:storeapp/widget/custom_field.dart';

import '../widget/custom_button.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({super.key});
  static String id = 'UpdateProduct';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? title, price, description, image, category;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProudectModel product =
        ModalRoute.of(context)!.settings.arguments as ProudectModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Update Product'),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomField(
                initialfield: product.title,
                hint: 'title',
                onchanged: (data) {
                  title = data;
                },
              ),
              SizedBox(height: 15),
              CustomField(
                initialfield: product.price.toString(),
                inputType: TextInputType.number,
                hint: 'price',
                onchanged: (data) {
                  price = data;
                },
              ),
              SizedBox(height: 15),
              CustomField(
                initialfield: product.description,
                hint: 'description',
                onchanged: (data) {
                  description = data;
                },
              ),
              SizedBox(height: 15),
              CustomField(
                initialfield: product.image,
                hint: 'image',
                onchanged: (data) {
                  image = data;
                },
              ),
              SizedBox(height: 15),
              CustomField(
                initialfield: product.category,
                hint: 'category',
                onchanged: (data) {
                  category = data;
                },
              ),
              SizedBox(height: 15),
              CustomButton(
                ontap: () async {
                  isloading = true;
                  setState(() {});
                  try {
                    await update(product);
                    print('success');
                  } catch (e) {
                    print(e.toString());
                    isloading = false;
                    setState(() {});
                  }
                },
                button: 'Update Produect',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> update(ProudectModel product) async {
    await UpdateProductget().updateProduct(
      id: product.id,
      title: title ?? product.title,
      price: price ?? product.price,
      description: description ?? product.description,
      image: image ?? product.image,
      category: category ?? product.category,
    );
  }
}
