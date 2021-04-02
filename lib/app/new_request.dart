import 'package:flutter/material.dart';
import 'package:my_e_service_company/app/Product.dart';
import 'package:my_e_service_company/common_widgets/item_card_HistoryProduct.dart';
import 'package:my_e_service_company/service/DatabaseService.dart';
import 'package:provider/provider.dart';

class NewRequest extends StatefulWidget {
  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  List<Product> NewRequestProduct;

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
          NewRequestProduct != null
              ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: NewRequestProduct.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                  NewRequestProduct[index] != null
                      ? HistoryProduct(
                      product: NewRequestProduct[index], press: () {})
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
        NewRequestProduct = value
            .where((element) => element.CompleletedTask == false)
            .toList();
        print(NewRequestProduct.length);
      });
    });
  }

}
