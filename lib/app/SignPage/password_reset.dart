import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_e_service_company/common_widgets/form_submit_button.dart';
import 'package:my_e_service_company/common_widgets/platform_exception_alert_dialog.dart';
import 'package:my_e_service_company/service/auth.dart';
import 'package:provider/provider.dart';

class PasswordReset extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String email;


  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2.0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => val.isEmpty
                        ? "Enter a Email Address"
                        : validateEmail(val),
                    onChanged: (val) {
                      this.email = val;
                    },
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => _request(context,email),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  FormSubmitButton(
                    onPressed: () => _request(context,email),
                    text: "Sign In",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _request(BuildContext context,String email) {
    try {
      final auth = Provider.of<AuthBase>(context,listen: false);
      auth.passwordReset(email);
      //Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //_showPasswordResetError(context,e);
      print(e.toString());
    }

  }

  void _showPasswordResetError(BuildContext context, FirebaseAuthException exception) {
    FirebaseAuthExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }

}

