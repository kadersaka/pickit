import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickit/utils/constants.dart';
import 'package:pickit/pages/main_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OTPScreen extends StatefulWidget {
  final String phonNumber;

  const OTPScreen({Key key, this.phonNumber}) : super(key: key);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Color continueButtonColor = Colors.grey[500];
  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var thirdController = TextEditingController();
  var fourthController = TextEditingController();
  var fifthController = TextEditingController();

  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    loadingDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 150.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SpinKitRing(
                    color: Theme.of(context).primaryColor,
                    lineWidth: 1.5,
                    size: 35.0,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text('Please Wait..', style: CustomTextStyle().greySmallTextStyle),
                ],
              ),
            ),
          );
        },
      );
      Timer(
          Duration(seconds: 3),
              () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainHomePage()),
          ));
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     SizedBox(height: 20.0,),
                      Text(
                        'Saisissez le code qui vous a été envoyé par SMS au ${widget.phonNumber}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 50.0),
                      // OTP Box Start
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // 1 Start
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: CustomTextStyle().whiteColor,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(width: 0.2, color: Theme.of(context).primaryColor),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: firstController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              onChanged: (v) {
                                FocusScope.of(context)
                                    .requestFocus(secondFocusNode);
                                if (firstController.text != '' &&
                                    secondController.text != '' &&
                                    thirdController.text != '' &&
                                    fourthController.text != '' &&
                                    fifthController.text != '') {
                                  setState(() {
                                    continueButtonColor = Theme.of(context).primaryColor;
                                  });
                                } else {
                                  setState(() {
                                    continueButtonColor = Colors.grey[500];
                                  });
                                }
                              },
                            ),
                          ),
                          // 1 End
                          // 2 Start
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(width: 0.2, color: Theme.of(context).primaryColor),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextField(
                              focusNode: secondFocusNode,
                              controller: secondController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              onChanged: (v) {
                                FocusScope.of(context)
                                    .requestFocus(thirdFocusNode);
                                if (firstController.text != '' &&
                                    secondController.text != '' &&
                                    thirdController.text != '' &&
                                    fourthController.text != '' &&
                                    fifthController.text != '') {
                                  setState(() {
                                    continueButtonColor = Theme.of(context).primaryColor;
                                  });
                                } else {
                                  setState(() {
                                    continueButtonColor = Colors.grey[500];
                                  });
                                }
                              },
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
//                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                              Border.all(width: 0.2, color: Theme.of(context).primaryColor),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextField(
                              focusNode: thirdFocusNode,
                              controller: thirdController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              onChanged: (v) {
                                FocusScope.of(context)
                                    .requestFocus(fourthFocusNode);
                                if (firstController.text != '' &&
                                    secondController.text != '' &&
                                    thirdController.text != '' &&
                                    fourthController.text != '' &&
                                    fifthController.text != '') {
                                  setState(() {
                                    continueButtonColor = Theme.of(context).primaryColor;
                                  });
                                } else {
                                  setState(() {
                                    continueButtonColor = Colors.grey[500];
                                  });
                                }
                              },
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
//                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                              Border.all(width: 0.2, color: Theme.of(context).primaryColor),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextField(
                              focusNode: fourthFocusNode,
                              controller: fourthController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              onChanged: (v) {
                                FocusScope.of(context)
                                    .requestFocus(fifthFocusNode);
                                if (firstController.text != '' &&
                                    secondController.text != '' &&
                                    thirdController.text != '' &&
                                    fourthController.text != '' &&
                                    fifthController.text != '') {
                                  setState(() {
                                    continueButtonColor = Theme.of(context).primaryColor;
                                  });
                                } else {
                                  setState(() {
                                    continueButtonColor = Colors.grey[500];
                                  });
                                }
                              },
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
//                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                              Border.all(width: 0.2, color: Theme.of(context).primaryColor),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextField(
                              focusNode: fifthFocusNode,
                              controller: fifthController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              onChanged: (v) {
                                if (firstController.text != '' &&
                                    secondController.text != '' &&
                                    thirdController.text != '' &&
                                    fourthController.text != '' &&
                                    fifthController.text != '') {
                                  setState(() {
                                    continueButtonColor = Theme.of(context).primaryColor;
                                  });
                                } else {
                                  setState(() {
                                    continueButtonColor = Colors.grey[500];
                                  });
                                }
                                loadingDialog();
                              },
                            ),
                          ),
                          // 4 End
                        ],
                      ),
                      // OTP Box End
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
            child: InkWell(
              onTap: () {
                if (firstController.text != '' &&
                    secondController.text != '' &&
                    thirdController.text != '' &&
                    fourthController.text != '' &&
                    fifthController.text != '') {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => BottomBar()));
                }
              },
              child: AnimatedContainer(
                width: width - CustomTextStyle().fixPadding * 2.0,
                padding: EdgeInsets.all(CustomTextStyle().fixPadding * 1.0),
                duration: Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: continueButtonColor,
                ),
                child: Text(
                  'Continuer',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
