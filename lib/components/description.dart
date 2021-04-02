import 'package:flutter/material.dart';
import 'package:my_e_service_company/app/Product.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(height: 1.5),
        ),
        Text(
          product.Description,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        product.Attachments.isNotEmpty ? FlatButton(
          onPressed: () {},
          minWidth: 0,
          child: Text(
            "Show Attactments",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ) : Container(),
      ],
    );
  }
}
