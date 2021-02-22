import 'package:flutter/material.dart';
import 'package:my_e_service_company/service/auth.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'SignPage/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<baseUser>(
        stream: auth.onAuthStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            baseUser user = snapshot.data;
            if (user == null) {
              return SignInPage(isLoading: false,);
            }
            return HomePage();
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
