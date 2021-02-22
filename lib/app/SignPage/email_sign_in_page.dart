import 'package:flutter/material.dart';
import 'package:my_e_service_company/common_widgets/form_submit_button.dart';

class EmailSignInPage extends StatelessWidget {
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
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                  validator: (val) => val.isEmpty ? "Enter a Password" : null
                ),
                SizedBox(
                  height: 8.0,
                ),
                FormSubmitButton(
                  onPressed: () {},
                  text: "Sign In",
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextButton(
                  onPressed: () {},
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
      backgroundColor: Colors.grey[200],
    );
  }
}
