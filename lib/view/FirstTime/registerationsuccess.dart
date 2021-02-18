import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/FirstTime/creditscoringform.dart';
import 'package:ligmone/view/firstTime/components/buttons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegistrationSuccess extends StatefulWidget {
  @override
  _RegistrationSuccessState createState() => _RegistrationSuccessState();
}

class _RegistrationSuccessState extends State<RegistrationSuccess> {
  bool validated = false;
  String phonenumber;
  int index;
  int currentindex;

  bool isSelected = false;
  List selectedElementList = [];
  List name = [
    "Calculate my Credit Score",
    "Calculate my Loan",
    "Suggest Me A Loan Service",
    "Learn About Loan Policies",
    "Explore Ligmone"
  ];

  bool isSelected1 = false;

  bool isSelected2 = false;

  bool isSelected3 = false;

  bool isSelected4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              color: CustomColors.blue,
              height: 400,
              width: 500,
            ),
          ),
          Container(
            height: Get.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
              color: CustomColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(110),
                  topRight: Radius.circular(110),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.14,
            top: Get.height * 0.30,
            child: Container(
              width: Get.width * 0.80,
              height: Get.height,
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 10,
                      child: Buttons(
                        child: name[index],
                        isSelected: selectedElementList.contains(name[index]),
                        onPressed: () {
                          setState(() {
                            //   index = name.indexOf(n);
                            selectedElementList.contains(name[index])
                                ? selectedElementList.remove(name[index])
                                : selectedElementList.add(name[index]);
                          });
                        },
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            top: 100,
            left: 60,
            child: Text(
              "Let's help you get started",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Positioned(
            top: 150,
            left: 100,
            child: Text(
              "What are you looking for?",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width * 0.13,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: Get.width * 0.85,
              height: 50,
              child: RaisedButton(
                disabledColor: CustomColors.lightgray3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: CustomColors.blue,
                onPressed: () {
                  Get.off(() => CreditScoringForm());
                  //   Get.snackbar("asdasd", Get.width.toString());
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
          ),
        ],
      ),
    );
  }
}
