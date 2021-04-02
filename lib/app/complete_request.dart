import 'package:flutter/material.dart';
import 'package:my_e_service_company/app/Product.dart';
import 'package:my_e_service_company/common_widgets/item_card_HistoryProduct.dart';
import 'package:my_e_service_company/service/DatabaseService.dart';
import 'package:provider/provider.dart';

class CompletedRequest extends StatefulWidget {
  @override
  _CompletedRequestState createState() => _CompletedRequestState();
}

class _CompletedRequestState extends State<CompletedRequest> {
  List<Product> CompletedRequestProduct;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 5.0, top: 20),
            child: Text(
              "My Requests",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          CompletedRequestProduct != null
              ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: CompletedRequestProduct.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                  CompletedRequestProduct[index] != null
                      ? HistoryProduct(
                      product: CompletedRequestProduct[index], press: () {})
                      : Container()),
            ),
          )
              : Container()
        ],
      ),
    );
  }

  @override
  void initState() {
    getHistoryData();
  }

  Future<void> getHistoryData() async {
    final database = Provider.of<Database>(context, listen: false);
    await database.getMyRequestProductData().then((value) {
      setState(() {
        //myProduct = value;
        CompletedRequestProduct = value
            .where((element) => element.CompleletedTask == true)
            .toList();
        print(CompletedRequestProduct.length);
      });
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
