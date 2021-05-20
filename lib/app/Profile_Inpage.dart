
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common_widgets/platform_alert_dialog.dart';
import '../service/DatabaseService.dart';
import '../service/auth.dart';
import 'SignPage/sign_in_page.dart';


class ProfileInPage extends StatefulWidget {
  @override
  _ProfileInPageState createState() => _ProfileInPageState();
}

class _ProfileInPageState extends State<ProfileInPage> {
  String name = "0";

  String email = "0";

  String Phone = "0";

  String Photourl;

  Map<String, String> dataset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdataFirebaseAndSharedPrefence(context),
          builder: (context, value) {
            if (value.connectionState == ConnectionState.done) {
              print(value.connectionState);
              print(value.data);
              if (value.data != null) {
                return SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20.0),
                                      height: 110,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            value.data["title"],
                                            style: TextStyle(fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.start,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            value.data["phone"],
                                            style: TextStyle(fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            value.data["email"],
                                            style: TextStyle(fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    height: MediaQuery.of(context).size.height * 0.12,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100.0)),
                                        image: value.data["img"] != null
                                            ? DecorationImage(
                                            image: NetworkImage(value.data["img"]),
                                            fit: BoxFit.cover)
                                            : DecorationImage(
                                            image: AssetImage(
                                                "images/person/2x/person.png"))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.only(topLeft: Radius
                                  .circular(50), topRight: Radius.circular(50))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.help_outline, size: 25,),
                                        SizedBox(width: 5,),
                                        Text("Help and Support",
                                            style: TextStyle(fontSize: 16.0)),
                                      ],
                                    )),
                                FlatButton(
                                    onPressed: () => _confirmSignOut(context),
                                    child: Row(
                                      children: [
                                        Icon(Icons.logout, size: 24,),
                                        SizedBox(width: 5,),
                                        Text("Logout",
                                            style: TextStyle(fontSize: 16.0)),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>  SignInPage(isLoading: false,)),
              (Route<dynamic> route) => false);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getdataFirebaseAndSharedPrefence(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    return await database.getProfileData();
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
}
