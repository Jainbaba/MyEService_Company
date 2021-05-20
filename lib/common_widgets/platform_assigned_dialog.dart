import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_e_service_company/common_widgets/platform_widget.dart';

class PlatformAssignDialog extends PlatformWidget {
  final _formKey = GlobalKey<FormState>();

  String techieName;
  String techieNumber;
  String shortDes;

  Map<String, dynamic> data;
  PlatformAssignDialog({
    @required this.title,
    this.cancelActionText,
    @required this.defaultActionText,
  })  : assert(title != null),
        assert(defaultActionText != null);

  final String title;
  final String cancelActionText;
  final String defaultActionText;

  Future<Map<String, dynamic>> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<Map<String, dynamic>>(
            context: context,
            builder: (context) => this,
          )
        : await showDialog<Map<String, dynamic>>(
            context: context,
            barrierDismissible: false,
            builder: (context) => this,
          );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Container(
        //height: 250,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Techie Name",
                ),
                textInputAction: TextInputAction.done,
                validator: (val) => val.isEmpty ? "Enter Techie Name" : null,
                onChanged: (val) {
                  techieName = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Techie Phone Number",

                ),
                textInputAction: TextInputAction.done,
                validator: (val) => val.isEmpty ? "Enter Techie Phone Number" : null,
                onChanged: (val) {
                  techieNumber = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Short Description",
                    alignLabelWithHint: true
                ),
                textInputAction: TextInputAction.done,
                onChanged: (val) {
                  shortDes = val;
                },
                maxLines: 3,
              ),
              /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Techie Name:"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(width: 125,child: TextFormField()),
                ),
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Techie PhNo.:"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: 125,child: TextFormField()),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text("Short Description:"),
              TextFormField(maxLines: 3,),*/
            ],),
        ),
      ),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Container(
        //height: 250,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Techie Name",
                ),
                textInputAction: TextInputAction.done,
                validator: (val) => val.isEmpty ? "Enter Techie Name" : null,
                onChanged: (val) {
                  techieName = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Techie Phone Number",

                ),
                textInputAction: TextInputAction.done,
                validator: (val) => val.isEmpty ? "Enter Techie Phone Number" : null,
                onChanged: (val) {
                  techieNumber = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Short Description",
                    alignLabelWithHint: true
                ),
                textInputAction: TextInputAction.done,
                onChanged: (val) {
                  shortDes = val;
                },
                maxLines: 3,
              ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Techie Name:"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(width: 125,child: TextFormField()),
                ),
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Techie PhNo.:"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: 125,child: TextFormField()),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text("Short Description:"),
              TextFormField(maxLines: 3,),*/
          ],),
        ),
      ),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];
    if (cancelActionText != null) {
      actions.add(
        PlatformAlertDialogAction(
          child: Text(cancelActionText),

          onPressed: () {
            data = {
              "value" : false
            };
            Navigator.of(context).pop(data);
          }
        ),
      );
    }
    actions.add(
      PlatformAlertDialogAction(
        child: Text(defaultActionText),
        onPressed: () {
          if (_formKey.currentState.validate()){
            data = {
              "value" : true,
              "name" : techieName,
              "number": techieNumber,
              "shortDes" : shortDes
            };
            Navigator.of(context).pop(data);
          }
        }
      ),
    );
    return actions;
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  PlatformAlertDialogAction({this.child, this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return TextButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
