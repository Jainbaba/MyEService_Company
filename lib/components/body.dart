import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_e_service_company/app/Product.dart';
import 'package:my_e_service_company/service/DatabaseService.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:intl/intl.dart';
import 'color_and_size.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatefulWidget {
  Product product;

  Body({Key key, this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Stack(
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.25),
                    padding: EdgeInsets.all(10),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ColorAndSize(product: widget.product),
                        SizedBox(height: 10 / 2),
                        Description(product: widget.product),
                        SizedBox(height: 10 / 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*Text(
                                    'Valid Warranty?',
                                    style: TextStyle(fontSize: 16.0),
                                  ),*/
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),

                                  )),
                              /*height: double.infinity,*/
                              padding: new EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(children: [

                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text( widget.product.AcceptedTask ? widget.product.AssignedTask ? widget.product.CompleletedTask ? "Task is Completed" : "Task has been Assigned" : "Task is Accepted" : "Request Has been sent"

                                          ,style: TextStyle(fontSize: 18 ),),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),

                            ),
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey,
                                    width: 1,),
                                    right: BorderSide(color: Colors.grey,
                                      width: 1,),
                                    left: BorderSide(color: Colors.grey,
                                      width: 1,),
                                  ),
                                ),
                                /*height: double.infinity,*/
                                padding: new EdgeInsets.only(left: 50.0,right: 50.0,top: 20,bottom: 20),
                                child:Container(
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              FaIcon(FontAwesomeIcons.checkCircle,color: Colors.green,),
                                              SizedBox(width: 20,),
                                              Container(
                                                  child: Text("Request has been sent\n${DateFormat("dd-MM-yyyy HH:ss").format(widget.product.timestamp.toDate())}")),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                            child: FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.grey[500],size: 16,),
                                          ),
                                          Row(
                                            children: [
                                              widget.product.AcceptedTask ? FaIcon(FontAwesomeIcons.checkCircle,color: Colors.green,) : FaIcon(FontAwesomeIcons.circle,color: Colors.grey,),
                                              SizedBox(width: 20,),
                                              widget.product.AcceptedTask ? Text("Request has been Accepted\n${DateFormat("dd-MM-yyyy HH:ss").format(widget.product.AcceptedTimestamp.toDate())}") :
                                              Container(
                                                  height: 35,child: Center(child: Text("Waiting to be Accepted")))
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                            child: FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.grey[500],size: 16,),
                                          ),
                                          Row(
                                            children: [
                                              widget.product.AssignedTask ? FaIcon(FontAwesomeIcons.checkCircle,color: Colors.green,) : FaIcon(FontAwesomeIcons.circle,color: Colors.grey,),
                                              SizedBox(width: 20,),
                                              widget.product.AssignedTask ? Text("Request has been Assigned\n${DateFormat("dd-MM-yyyy HH:ss").format(widget.product.AssignedTimestamp.toDate())}") : Container(height: 35,
                                                  child: Center(child: Text("Waiting for a person to be Assigned"))),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                            child: FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.grey[500],size: 16,),
                                          ),
                                          Row(
                                            children: [
                                              widget.product.CompleletedTask ? FaIcon(FontAwesomeIcons.checkCircle,color: Colors.green,) : FaIcon(FontAwesomeIcons.circle,color: Colors.grey,),
                                              SizedBox(width: 20,),
                                              widget.product.CompleletedTask ? Text("Request has been Completed\n${DateFormat("dd-MM-yyyy HH:ss").format(widget.product.completedTimestamp.toDate())}") : Container(
                                                  height: 35
                                                  ,child: Center(child: Text("Waiting for the task to be Completed")))
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                              /* Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        FaIcon(FontAwesomeIcons.checkCircle,color: Colors.green,),
                                        SizedBox(width: 10,),
                                        Text("Request has been sent\n${DateFormat("dd-MM-yyyy HH:ss").format(widget.product.timestamp.toDate())}")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.grey,size: 12,),
                                            widget.product.AcceptedTask ? FaIcon(FontAwesomeIcons.checkCircle,color: Colors.green,) : FaIcon(FontAwesomeIcons.circle,color: Colors.grey,),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        widget.product.AcceptedTask ? Text("Request has been Accepted\n${DateFormat("dd-MM-yyyy HH:ss").format(widget.product.AcceptedTimestamp.toDate())}") : Text("Waiting to be Accepted")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.grey,size: 12,),
                                            widget.product.AssignedTask ? FaIcon(FontAwesomeIcons.checkCircle,color: Colors.green,) : FaIcon(FontAwesomeIcons.circle,color: Colors.grey,),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        widget.product.AssignedTask ? Text("Request has been Assigned\n${DateFormat("dd-MM-yyyy HH:ss").format(widget.product.AssignedTimestamp.toDate())}") : Text("Waiting for a person to be Assigned")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.grey,size: 12,),
                                            widget.product.CompleletedTask ? FaIcon(FontAwesomeIcons.checkCircle,color: Colors.green,) : FaIcon(FontAwesomeIcons.circle,color: Colors.grey,),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        widget.product.CompleletedTask ? Text("Request has been Completed\n${DateFormat("dd-MM-yyyy HH:ss").format(widget.product.completedTimestamp.toDate())}") : Text("Waiting for the task to be Completed")
                                      ],
                                    ),
                                  ],
                                ),*/
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey,
                                  width: 1,),
                                  right: BorderSide(color: Colors.grey,
                                    width: 1,),
                                  left: BorderSide(color: Colors.grey,
                                    width: 1,),
                                ),),
                              padding: new EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.product.AssignedTask ? Text("Assigned Techie: ${widget.product.AssignedTechiename}") : Container(),
                                  widget.product.AssignedTask ? Text("${widget.product.AssignedTechiePhone}",style: TextStyle(fontWeight: FontWeight.w500),) : Container(),
                                  Text("To: ${widget.product.requestSent}",),
                                  SizedBox(height: 10,),
                                  Text("From: ${widget.product.Username}",),
                                  Text("${widget.product.UserPhone}",style: TextStyle(fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SliderButton(
                                    width: MediaQuery.of(context).size.width * 0.90,
                                    action: () {
                                      final database = Provider.of<Database>(context, listen: false);
                                      if (!widget.product.AcceptedTask) {
                                        database.sendAcceptedRequest(
                                            widget.product).then((value) {
                                          setState(() {
                                            widget.product = value;
                                          });
                                        });
                                      } else if (widget.product.AcceptedTask & !widget.product.AssignedTask){
                                        database.sendAssignedRequest(
                                            widget.product).then((value) {
                                          setState(() {
                                            widget.product = value;
                                          });
                                        });
                                      }else if (widget.product.AcceptedTask & widget.product.AssignedTask & !widget.product.CompleletedTask) {
                                        print("hello");
                                        database.sendCompleteRequest(
                                            widget.product).then((value) {
                                          setState(() {
                                            widget.product = value;
                                          });
                                        });
                                      }
                                    },
                                    label: Text(
                                      widget.product.AcceptedTask ? widget.product.AssignedTask ? "Slide to Complete the Task" : "Slide to Assign the Task" : "Slide to Accept the Task",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff4a4a4a),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                    icon: FaIcon(FontAwesomeIcons.chevronRight)
                                ),
                              ),
                            )
                          ],
                        ),
                        /* Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            */

                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: widget.product),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
