import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/Authentication/localauth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  int start = 59;
  var onesecond = Duration(seconds: 1);
  final key = GlobalKey<FormState>();
  Timer _timer;
  String name;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  GlobalKey<FormFieldState> _nameFormKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> _lastNameFormKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> _phoneNumberFormKey = GlobalKey<FormFieldState>();
  String lastname;
  bool validated = false;
  String phonenumber;
  bool isFormValid() {
    return (_nameFormKey.currentState.isValid &&
        _lastNameFormKey.currentState.isValid &&
        _phoneNumberFormKey.currentState.isValid);
  }

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
        child: Form(
          key: key,
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
                    margin: EdgeInsets.only(left: 20, top: 10, bottom: 50),
                    //  /   width: 30,
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "   Enter the 4 numbers that were sent to your phone and continue",
                        style: TextStyle(
                            color: CustomColors.lightgray3, fontSize: 10))),
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,

                  //  obscureText: true,
                  //  obscuringCharacter: '*',
                  // blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v.length < 4) {
                      return "Fill all fields";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    borderWidth: 0.01,
                    //activeColor: CustomColors.lightgray,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(15),
                    fieldHeight: 55,
                    fieldWidth: 55,
                    activeColor: Colors.grey,
                    activeFillColor: CustomColors.blue,
                    inactiveColor: CustomColors.lightgray2,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  //   enableActiveFill: true,
                  enablePinAutofill: true,
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: CustomColors.lightgray,
                      blurRadius: 0.1,
                    )
                  ],
                  onCompleted: (v) {
                    print("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      //     currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
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
