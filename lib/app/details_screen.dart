import 'package:flutter/material.dart';
import 'package:my_e_service_company/app/Product.dart';
import 'package:my_e_service_company/components/body.dart';
class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      //backgroundColor: product.color,
      body: Body(product: product),
    );
  }

}
