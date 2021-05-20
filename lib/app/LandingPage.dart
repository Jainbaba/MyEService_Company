import 'package:flutter/material.dart';
import 'package:my_e_service_company/service/DatabaseService.dart';
import 'package:my_e_service_company/service/auth.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'SignPage/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<BaseUser>(
        stream: auth.onAuthStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            BaseUser user = snapshot.data;
            if (user == null) {
              return SignInPage(isLoading: false,);
            }
            return Provider<Database>(
                create: (_) => FireStoreDatabase(uid: user.uid), child: HomePage(uid: user.uid,));
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
