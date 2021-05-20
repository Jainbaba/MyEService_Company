import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:my_e_service_company/app/Product.dart';
import 'package:my_e_service_company/app/Profile_Inpage.dart';
import 'package:my_e_service_company/app/complete_request.dart';
import 'package:my_e_service_company/app/new_request.dart';
import 'package:my_e_service_company/common_widgets/platform_alert_dialog.dart';
import 'package:my_e_service_company/service/DatabaseService.dart';
import 'package:my_e_service_company/service/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({this.uid});
  @override
  _HomePageState createState() => _HomePageState();
  String uid;
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  TabController _tabController;

  List<Product> NewRequestProduct;

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context,listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }



  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2,vsync: this);
    //getHistoryData();
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text("MyEService Company"),
        actions: <Widget>[
          ElevatedButton.icon(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Provider<Database>(
                      create: (_) => FireStoreDatabase(uid: widget.uid), child: ProfileInPage())),
            );
          }, icon: Icon(Icons.person), label: Text(""))
          /*TextButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),*/
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.indigo,
        child: SafeArea(
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            tabs: [
              Container(
                  height: 50,
                  child: new Tab(
                    text: "New",
                  )),
              Container(
                  height: 50,
                  child: new Tab(
                    text: "Completed",
                  )),
            ],
          ),
        ),
      ),
      body:  CustomNavigator(
        key: navigatorKey,
        home: _Page(),
        pageRoute: PageRoutes.materialPageRoute,
      ),
    );
  }

  Widget _Page() {
    return TabBarView(
      controller: _tabController,
      children: [
        NewRequest(),
        CompletedRequest(),
      ],
    );
  }
}
