import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/model/proudect_model.dart';
import 'package:storeapp/screens/update_product.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});
  ProudectModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, UpdateProduct.id, arguments: product);
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(5, 3),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 8),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toString()}',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: -70,
          child: Image.network(product.image, height: 120, width: 100),
        ),
      ],
    );
  }
}
