import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/SizeConfig.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/FirstTime/creditscoringform.dart';
import 'package:ligmone/view/app/loancritriacalculator.dart';
import 'package:ligmone/view/app/notcomputed.dart';
import 'package:ligmone/view/firstTime/components/buttons.dart';

//this page for getting user choice ,each button leads to different page
class RegistrationSuccess extends StatefulWidget {
  @override
  _RegistrationSuccessState createState() => _RegistrationSuccessState();
}

class _RegistrationSuccessState extends State<RegistrationSuccess> {
  List selectedElementList = []; //selected item list
  List name = [
    "Calculate my Credit Score",
    "Calculate my Loan",
    "Suggest Me A Loan Service",
    "Learn About Loan Policies",
    "Explore Ligmone"
  ]; //list of button names

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              color: CustomColors.blue,
              height: 400,
              width: SizeConfig.blockSizeHorizontal * 100,
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
            left: SizeConfig.blockSizeHorizontal * 5,
            top: SizeConfig.blockSizeVertical * 30,
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 90,
              height: Get.height,
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Buttons(
                      child: name[index],
                      isSelected: selectedElementList.contains(name[
                          index]), // check if the current button is in selected element list and sends bool value
                      onPressed: () {
                        setState(() {
                          selectedElementList.clear();

                          selectedElementList.add(name[index]);
                        });
                      },
                    );
                  }),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10),
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Let's help you get started",
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 3,
                      color: Colors.white),
                ),
                Text(
                  "What are you looking for?",
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: SizeConfig.blockSizeHorizontal * 5,
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 90,
              height: SizeConfig.blockSizeVertical * 6,
              child: RaisedButton(
                disabledColor: CustomColors.lightgray3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: CustomColors.blue,
                onPressed: !selectedElementList.isEmpty
                    ? () {
                        if (selectedElementList.contains(name[0])) {
                          Get.to(() => CreditScoringForm());
                        } else if (selectedElementList.contains(name[1])) {
                          Get.to(() => LoanCriteriaCalculator());
                        } else if (selectedElementList.contains(name[2])) {
                          //   Get.to(() => CreditScoringForm());
                        } else if (selectedElementList.contains(name[3])) {
                          //  Get.to(() => CreditScoringForm());
                        } else if (selectedElementList.contains(name[4])) {
                          Get.to(() => NotComputed());
                        } else {}
                      }
                    : null,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Next",
                    style: TextStyle(color: CustomColors.white, fontSize: 20),
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
