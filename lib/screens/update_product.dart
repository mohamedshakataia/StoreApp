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
                hint: 'title',
                onchanged: (data) {
                  title = data;
                },
              ),
              SizedBox(height: 15),
              CustomField(
                inputType: TextInputType.number,
                hint: 'price',
                onchanged: (data) {
                  price = data;
                },
              ),
              SizedBox(height: 15),
              CustomField(
                hint: 'description',
                onchanged: (data) {
                  description = data;
                },
              ),
              SizedBox(height: 15),
              CustomField(
                hint: 'image',
                onchanged: (data) {
                  image = data;
                },
              ),
              SizedBox(height: 15),
              CustomField(
                hint: 'category',
                onchanged: (data) {
                  category = data;
                },
              ),
              SizedBox(height: 15),
              CustomButton(
                ontap: () {
                  isloading = true;
                  setState(() {});
                  try {
                    update(product);
                    print('success');
                  } catch (e) {
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

  void update(ProudectModel product) {
    UpdateProductget().updateProduct(
      title: product.title,
      price: product.price,
      description: product.description,
      image: product.image,
      category: product.category,
    );
  }
}
