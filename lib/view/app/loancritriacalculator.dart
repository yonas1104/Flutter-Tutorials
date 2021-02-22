import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/FirstTime/components/dropdownbuttons.dart';
import 'package:ligmone/view/app/notcomputed.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../SizeConfig.dart';
import '../alertdialog.dart';
import '../alertdialog.dart';
import '../creditscoringtextfield.dart';
import 'home.dart';

//loan critrea form
class LoanCriteriaCalculator extends StatefulWidget {
  @override
  _LoanCriteriaCalculatorState createState() => _LoanCriteriaCalculatorState();
}

class _LoanCriteriaCalculatorState extends State<LoanCriteriaCalculator> {
  @override
  void initState() {
    checkFirstRun();
    super.initState();
  }

  String firstinstall = "no";
  bool showdialog = false;
  checkFirstRun() async {
    //check the app is on first time use to show dialog
    String firstinstall = "";
    preferences = await SharedPreferences.getInstance();

    firstinstall = preferences.getString("installedloancr");

    if (firstinstall != "installed") {
      showdialog = true;

      preferences.setString("installedloancr", "installed");
    }
  }

  tipDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            buttontext: "Continue ",
            description:
                "Having a good credit score comes with many advantages of having a significant saving on interest rates, getting better deals on loans, insurance discounts and so much more. read more   ",
            title: "Credit Scoring",
            imagepath: "assets/images/alert.svg",
            onPressed: () {
              Get.back();
            },
          );
        });
  }

  List<String> statusOfCheckingAccount = ["Choose loan typet", "two", "three"];
  List<String> creditHistory = ["Credit history", "two", "three"];
  List<String> durationInAMonth = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  List<String> purpose = ["Purpose", "two", "three"];

  String selectedStatus;
  String selectedcreditHistory;
  String selecteddurationInAMonth;
  String selectedPurpose;

  bool isSelectedHousing = false;

  bool isSelectedVechile = false;

  bool isSelectedBusiness = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(Duration.zero, () {
      if (showdialog) {
        tipDialog(context);
      } //show dialog if its first time use
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "Loan Information",
              style: TextStyle(
                color: CustomColors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Rockwellr",
              ),
            ),
          ),
          leading: IconButton(
              icon: SvgPicture.asset("assets/images/leadingarrowleft.svg"),
              onPressed: () {
                Get.to(() => NotComputed());
              }),
          actions: [
            IconButton(
                icon: SvgPicture.asset("assets/images/arrowleft.svg"),
                onPressed: () {}),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [CustomColors.white, CustomColors.homebackground])),
          alignment: Alignment.topCenter,
          height: SizeConfig.blockSizeVertical * 100,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text("General",
                      style: TextStyle(
                        color: CustomColors.lightgray3,
                      )),
                  SizedBox(
                    width: 280,
                  ),
                  SvgPicture.asset("assets/images/info.svg")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 19,
                        color: CustomColors.lightgray3,
                      )
                    ],
                    color: Colors.white),

                // child: ListView.builder(itemBuilder: (context, index) {
                //   return DropDownButtons(
                //     width: Get.width * 0.75,
                //     dropdownvalue: statusOfCheckingAccount,
                //     onChanged: (newvalue) {},
                //   );
                // }),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10, bottom: 20),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Loan Type",
                          style: TextStyle(color: CustomColors.lightgray3),
                        )),
                    DropDownButtons(
                      onChanged: (newvalue) {
                        setState(() {
                          selectedStatus = newvalue;
                        });
                      },
                      hint: "Choose loan type",
                      width: SizeConfig.blockSizeHorizontal * 80,
                      selected: selectedStatus,
                      dropdownvalue: statusOfCheckingAccount,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 19,
                        color: CustomColors.lightgray3,
                      )
                    ],
                    color: Colors.white),
                //  color: Colors.white,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Equity Contribution",
                          style: TextStyle(color: CustomColors.darkgray),
                        )),
                    CreditScoringTextField(
                      marginleft: 10,
                      width: SizeConfig.blockSizeHorizontal * 80,
                      // title: "Equity Contribution",
                      subtitle: "How much are you requesting",
                      hint: "0.0",
                      margintop: true,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CreditScoringTextField(
                          marginleft: 0,
                          // title: "Equity Contribution",
                          subtitle: "Bank Contribution",
                          hint: "0.0",
                          width: SizeConfig.blockSizeHorizontal * 37.5,
                          margintop: true,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        CreditScoringTextField(
                          marginleft: 100,
                          width: SizeConfig.blockSizeHorizontal * 37.5,
                          subtitle: " ",
                          hint: "0.0",
                          margintop: true,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(left: 0, right: 40, top: 10),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "amount in Birr",
                              style: TextStyle(color: CustomColors.lightgray3),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 30),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "amount in percent",
                              style: TextStyle(color: CustomColors.lightgray3),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 19,
                        color: CustomColors.lightgray3,
                      )
                    ],
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Collateral information",
                          style: TextStyle(color: CustomColors.darkgray),
                        )),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        FilterChip(
                          elevation: 4,
                          selectedColor: Colors.white,
                          checkmarkColor: CustomColors.blue,
                          backgroundColor: Colors.white,
                          label: Container(
                            //  margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Text("Housing",
                                style: TextStyle(
                                    fontSize: 15, color: CustomColors.blue)),
                          ),
                          onSelected: (value) {
                            setState(() {
                              isSelectedHousing = value;
                            });
                          },
                          selected: isSelectedHousing,
                        ),
                        FilterChip(
                          elevation: 4,
                          selectedColor: Colors.white,
                          checkmarkColor: CustomColors.blue,
                          backgroundColor: Colors.white,
                          label: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Text("Vehicle",
                                style: TextStyle(
                                    fontSize: 15, color: CustomColors.blue)),
                          ),
                          onSelected: (value) {
                            setState(() {
                              isSelectedVechile = value;
                            });
                          },
                          selected: isSelectedVechile,
                        ),
                        FilterChip(
                          elevation: 4,
                          selectedColor: Colors.white,
                          checkmarkColor: CustomColors.blue,
                          backgroundColor: Colors.white,
                          label: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Text("Business",
                                style: TextStyle(
                                    fontSize: 15, color: CustomColors.blue)),
                          ),
                          onSelected: (value) {
                            setState(() {
                              isSelectedBusiness = value;
                            });
                          },
                          selected: isSelectedBusiness,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin:
              //       EdgeInsets.only(top: 30, bottom: 40, left: 50, right: 50),
              //   width: Get.width * 0.7,
              //   height: 60,
              //   child: RaisedButton(
              //     disabledColor: CustomColors.lightgray3,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)),
              //     color: CustomColors.blue,
              //     onPressed: () async {
              //       preferences = await SharedPreferences.getInstance();
              //       setState(() {
              //         preferences.setBool("computed", true);
              //       });

              //       Get.to(() => NotComputed());
              //     },
              //     child: Container(
              //       alignment: Alignment.center,
              //       child: Text(
              //         "Continue",
              //         style: TextStyle(color: CustomColors.white, fontSize: 18),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }

  SharedPreferences preferences;
}
