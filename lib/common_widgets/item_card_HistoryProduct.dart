import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:my_e_service_company/app/Product.dart';
import 'package:my_e_service_company/app/details_screen.dart';


class HistoryProduct extends StatelessWidget {
  final Product product;
  final Function press;
  final TabController tabController;

  const HistoryProduct({
    this.tabController,
    this.product,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    /*decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),*/
                    width: 150,
                    height: 90,
                    child: Hero(
                      tag: "${product.title}",
                      child: Image.network(
                        product.image != null ? product.image : "0",
                        width: 200,
                        height: 90,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 90,
                      /*decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),*/
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${product.RequestID}",
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          Text(
                            // products is out demo list
                            "${product.title} (${product.brand})",
                            maxLines: 1,
                          ),
                          Text(
                            "${DateFormat("dd-MM-yyyy").format(product.timestamp.toDate())}",
                          ),
                        ],
                      ),

                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.solidCircle,size: 16,
                        color: product.AcceptedTask ? product.AssignedTask ? product.CompleletedTask ? Colors.transparent : Colors.green : Colors.yellow : Colors.red,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                   /* decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)),*/
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: product,)));
                          }, child: Icon(
                          Icons.arrow_forward_ios,size: 15,
                        ),minWidth: 1,),
                      ],
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
