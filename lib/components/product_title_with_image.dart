import 'package:flutter/material.dart';
import 'package:my_e_service_company/app/Product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            child: Icon(
              Icons.keyboard_backspace,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
            minWidth: 0,
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(color: Colors.black,fontSize: 24),
                  ),
                  Text(
                    product.brand,
                    style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Expanded(
                child: Container()
              )
            ],
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(color: Colors.transparent,fontSize: 24),
                  ),
                  Text(
                    product.brand,
                    style: TextStyle(color: Colors.transparent,fontSize: 18),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Expanded(
                child: Hero(
                  tag: "${product.title}",
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

