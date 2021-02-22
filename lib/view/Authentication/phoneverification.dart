import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/Authentication/localauth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pin_put/pin_put.dart';

//this is class to input received OTP in to the pincode fileds

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  int start = 59;
  final _pinPutFocusNode =
      FocusNode(); //focus node to unfocus when the fields are submitted
  Timer _timer; //timer to request code again if not received

  bool isSubmittedColorBlue =
      false; //to change pin fields color to blue once submitted

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blue,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 80, left: 2),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(150),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 30),
                  alignment: Alignment.centerLeft,
                  child: Text("Phone Verification",
                      style: TextStyle(
                          color: CustomColors.darkgray, fontSize: 20))),
              Container(
                  // color: Colors.black,
                  margin: EdgeInsets.only(left: 20, top: 10, bottom: 50),
                  //  /   width: 30,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Enter the 4 numbers that were sent to your phone and continue",
                      style: TextStyle(
                          color: CustomColors.lightgray3, fontSize: 10))),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: PinPut(
                  fieldsCount: 4,
                  withCursor: true,
                  textStyle:
                      const TextStyle(fontSize: 25.0, color: Colors.white),
                  eachFieldWidth: 55.0,
                  eachFieldHeight: 60.0,
                  focusNode: _pinPutFocusNode,
                  onSubmit: (String pin) {
                    _pinPutFocusNode
                        .unfocus(); //unfocusing once field submitted

                    setState(() {
                      isSubmittedColorBlue =
                          true; //changing color of pin fields once submitted
                    });
                  },
                  fieldsAlignment: MainAxisAlignment.center,
                  //eachFieldConstraints: BoxConstraints(maxHeight: 9),
                  eachFieldMargin:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),

                  submittedFieldDecoration: BoxDecoration(
                      color: CustomColors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  selectedFieldDecoration: BoxDecoration(
                      color: CustomColors.lightgray2,
                      borderRadius: BorderRadius.circular(20)),
                  followingFieldDecoration: BoxDecoration(
                      color:
                          !isSubmittedColorBlue //this will change all the color of fields to blue once submitted
                              ? CustomColors.lightgray2
                              : CustomColors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  pinAnimationType: PinAnimationType.fade,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: 350,
                height: 60,
                child: RaisedButton(
                  disabledColor: CustomColors.lightgray3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: CustomColors.blue,
                  onPressed: () {
                    Get.off(() => LocalAuth());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Next",
                      style: TextStyle(color: CustomColors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text("Resent in 00: $start",
                  style: TextStyle(color: CustomColors.darkgray)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }
}
