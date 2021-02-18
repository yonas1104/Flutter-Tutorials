import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/Authentication/phoneverification.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final key = GlobalKey<FormState>();

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
                    child: Text("Let's start",
                        style: TextStyle(
                            color: CustomColors.darkgray, fontSize: 20))),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 40, bottom: 15, top: 25),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Name",
                          style: TextStyle(color: CustomColors.lightgray3),
                        )),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                          color: CustomColors.lightgray,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: _nameController,
                        key: _nameFormKey,
                        onChanged: (value) {
                          setState(() {
                            validated = isFormValid();
                            _nameFormKey.currentState.validate();
                          });
                        },
                        validator: (value) {
                          if (value.length < 1) {
                            return "Please input your name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.lightgray),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.lightgray),
                              borderRadius: BorderRadius.circular(20)),

                          //   enabled: false,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 40, bottom: 15, top: 20),
                        alignment: Alignment.bottomLeft,
                        child: Text(" Last Name",
                            style: TextStyle(color: CustomColors.lightgray3))),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                          color: CustomColors.lightgray,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: _lastNameController,
                        key: _lastNameFormKey,
                        onChanged: (value) {
                          setState(() {
                            validated = isFormValid();
                            _lastNameFormKey.currentState.validate();
                          });
                        },
                        validator: (value) {
                          if (value.length < 1) {
                            return "Please input your last name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.lightgray),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.lightgray),
                              borderRadius: BorderRadius.circular(20)),

                          //   enabled: false,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40, bottom: 15, top: 25),
                      alignment: Alignment.bottomLeft,
                      child: Text("Enter your Phone number",
                          style: TextStyle(color: CustomColors.lightgray3)),
                    ),
                    Row(
                      //    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 20),
                          width: 100,
                          decoration: BoxDecoration(
                              color: CustomColors.lightgray2,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            enabled: false,
                            // controller: TextEditingController()..text = '  +251',
                            decoration: InputDecoration(
                              hintText: "  +251",
                              hintStyle: TextStyle(
                                color: CustomColors.darkgray,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: CustomColors.white),
                                  borderRadius: BorderRadius.circular(20)),

                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: CustomColors.lightgray),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: CustomColors.lightgray),
                                  borderRadius: BorderRadius.circular(20)),

                              //   enabled: false,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          decoration: BoxDecoration(
                              color: CustomColors.lightgray,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            controller: _phoneNumberController,
                            key: _phoneNumberFormKey,
                            onChanged: (value) {
                              setState(() {
                                validated = isFormValid();
                                _phoneNumberFormKey.currentState.validate();
                              });
                            },
                            validator: (value) {
                              if (value.length < 9) {
                                return "Please input your phone correctly";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: CustomColors.lightgray),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: CustomColors.lightgray),
                                  borderRadius: BorderRadius.circular(20)),

                              //   enabled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "We will send an SMS with a confirmation code to your phone number ",
                        style: TextStyle(color: CustomColors.lightgray3),
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
                        onPressed: !validated
                            ? null
                            : () {
                                Get.off(() => PhoneVerification());
                                // if (key.currentState.validate()) {}
                              },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Next",
                            style: TextStyle(color: CustomColors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
