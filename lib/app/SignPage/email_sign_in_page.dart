import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_e_service_company/app/HomePage.dart';
import 'package:my_e_service_company/app/SignPage/password_reset.dart';
import 'package:my_e_service_company/common_widgets/form_submit_button.dart';
import 'package:my_e_service_company/common_widgets/platform_alert_dialog.dart';
import 'package:my_e_service_company/common_widgets/platform_exception_alert_dialog.dart';
import 'package:my_e_service_company/service/auth.dart';
import 'package:provider/provider.dart';

class EmailSignInPage extends StatefulWidget {
  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  final _formKey = GlobalKey<FormState>();

  String email,password;

  final FocusNode emailnode = FocusNode();

  final FocusNode passwordnode = FocusNode();

  BaseUser user;


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
        child: SingleChildScrollView(
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
                    textInputAction: TextInputAction.next,
                    focusNode: emailnode,
                    onEditingComplete: () => passwordnode.requestFocus(),

                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    focusNode: passwordnode,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    validator: (val) => val.isEmpty ? "Enter a Password" : null,
                    onChanged: (val) {
                      this.password = val;
                    },
                    onEditingComplete: () => _submit(context),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  FormSubmitButton(
                    onPressed: () => _submit(context),
                    text: "Sign In",
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Provider<AuthBase>(
                            create: (_) => Auth(), child: PasswordReset()),
                      ));
                    },
                    child: Text(
                      "Need Help? Forgot Password",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            )),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  void _submit(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context,listen: false);
    if (_formKey.currentState.validate()) {
      try{
        user = await auth.signInWithEmailAndPassword(email, password);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context) => HomePage(uid: user.uid,)), (route) => false);
        //Navigator.pop(context);
      } on FirebaseAuthException catch (e){
        _showSignInError(context, e);
      }
    }
  }

  void _showSignInError(BuildContext context, FirebaseAuthException exception) {
    FirebaseAuthExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }
}
