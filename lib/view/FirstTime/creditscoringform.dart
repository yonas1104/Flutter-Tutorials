import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/SizeConfig.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/App/notcomputed.dart';
import 'package:ligmone/view/FirstTime/components/dropdownbuttons.dart';
import 'package:ligmone/view/app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../alertdialog.dart';
import '../creditscoringtextfield.dart';

//Personal information filling form

class CreditScoringForm extends StatefulWidget {
  @override
  _CreditScoringFormState createState() => _CreditScoringFormState();
}

class _CreditScoringFormState extends State<CreditScoringForm> {
  SharedPreferences preferences;
  TextEditingController controller;
  bool showdialog =
      false; //bool variable to check if the app is on first install and decide to show

  List<String> statusOfCheckingAccount = [
    "Status of existing checking account",
    "two",
    "three"
  ];
  String datepicked;
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
  ]; //duration in a month
  List<String> purpose = ["Purpose", "two", "three"];
  String selectedStatus;
  String selectedcreditHistory;
  String selecteddurationInAMonth;
  String selectedPurpose;

  checkFirstRun() async {
    //check the app is on first time use to show dialog
    String firstinstall = "";
    preferences = await SharedPreferences.getInstance();

    firstinstall = preferences.getString("installedcredit");

    if (firstinstall != "installed") {
      showdialog = true;

      preferences.setString("installedcredit", "installed");
    }
  }

  tipDialog(context) {
    showDialog(
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

  @override
  void initState() {
    checkFirstRun();
    controller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.screenWidth);
    Future.delayed(Duration.zero, () {
      if (showdialog) {
        tipDialog(context);
      } //show dialog if its first time use
    });

    // print(MediaQuery.of(context).size.height *
    //     MediaQuery.of(context).devicePixelRatio);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "Personal Information",
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
                Get.back();
              }),
          actions: [
            IconButton(
                icon: SvgPicture.asset("assets/images/arrowleft.svg"),
                onPressed: () {}),
          ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          alignment: Alignment.topCenter,
          //   height: MediaQuery.of(context).size.height,
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
                padding: EdgeInsets.all(15).copyWith(top: 25),
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
                    DropDownButtons(
                      onChanged: (newvalue) {
                        setState(() {
                          selectedStatus = newvalue;
                        });
                      },
                      hint: "Status of checking account",
                      width: SizeConfig.blockSizeHorizontal * 80,
                      selected: selectedStatus,
                      dropdownvalue: statusOfCheckingAccount,
                    ),
                    DropDownButtons(
                      onChanged: (newvalue) {
                        setState(() {
                          selectedcreditHistory = newvalue;
                        });
                      },
                      hint: "Credit History",
                      width: SizeConfig.blockSizeHorizontal * 80,
                      selected: selectedcreditHistory,
                      dropdownvalue: creditHistory,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropDownButtons(
                          hint: "Duration in month",
                          onChanged: (newvalue) {
                            setState(() {
                              selecteddurationInAMonth = newvalue;
                            });
                          },
                          width: SizeConfig.blockSizeHorizontal * 38.5,
                          //   margin: 33,
                          marginLeft: 10,
                          selected: selecteddurationInAMonth,
                          dropdownvalue: durationInAMonth,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        DropDownButtons(
                          hint: "Purpose",
                          onChanged: (newvalue) {
                            setState(() {
                              selectedPurpose = newvalue;
                            });
                          },
                          // margin: 33,
                          selected: selectedPurpose,
                          width: SizeConfig.blockSizeHorizontal * 35.5,
                          dropdownvalue: purpose,
                        ),
                      ],
                    )
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
                  child: Column(children: [
                    CreditScoringTextField(
                      title: "Status",
                      marginleft: 15,
                      width: SizeConfig.blockSizeHorizontal * 80,
                      subtitle: "Credit Amount",
                      hint: "0.0",
                    ),
                    CreditScoringTextField(
                      //    title: "Status",
                      width: SizeConfig.blockSizeHorizontal * 80,
                      margintopvalue: 15,
                      hint: "Savings account and bonds",
                    ),
                    CreditScoringTextField(
                        subtitle: "Employment",
                        hint: "Since",
                        controller: controller,
                        width: SizeConfig.blockSizeHorizontal * 80,
                        //   initialValue: " ",
                        onTap: () async {
                          DateTime picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          print(picked);
                          setState(() {
                            datepicked = picked.toString();
                            controller.text =
                                picked.toUtc().toString().split(" ")[0];
                          });
                        },
                        marginleft: 15,
                        icon: IconButton(
                          icon: SvgPicture.asset(
                            "assets/images/calendar.svg",
                            height: 25,
                          ),
                          onPressed: () {},
                        )),
                    CreditScoringTextField(
                      //    title: "Status",
                      margintopvalue: 15,
                      width: SizeConfig.blockSizeHorizontal * 80,
                      hint: "Job",
                    ),
                    CreditScoringTextField(
                      marginleft: 15,
                      subtitle:
                          "Installment rate in percentage of disposable income",
                      hint: "",
                      width: SizeConfig.blockSizeHorizontal * 80,
                    ),
                    DropDownButtons(
                      margintop: false,
                      onChanged: (newvalue) {
                        setState(() {
                          selectedStatus = newvalue;
                        });
                      },
                      // marginleft: 15,
                      title: "Personal status and sex",
                      width: SizeConfig.blockSizeHorizontal * 80,
                      hint: " ",
                      selected: selectedStatus,
                      dropdownvalue: statusOfCheckingAccount,
                    ),
                    CreditScoringTextField(
                      marginleft: 15,
                      width: SizeConfig.blockSizeHorizontal * 80,
                      subtitle: "Other debtors or guarantors",
                      hint: "",
                    ),
                  ])),
              //  Container(child: Column(children: [])),
              //   Container(child: Column(children: [])),
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
                    DropDownButtons(
                      onChanged: (newvalue) {
                        setState(() {
                          selectedStatus = newvalue;
                        });
                      },
                      title: "Collateral",
                      hint: "Property",
                      width: SizeConfig.blockSizeHorizontal * 80,
                      selected: selectedStatus,
                      dropdownvalue: statusOfCheckingAccount,
                    ),
                    DropDownButtons(
                      hint: "Present residence since",
                      onChanged: (newvalue) {
                        setState(() {
                          selectedPurpose = newvalue;
                        });
                      },
                      // margin: 33,
                      selected: selectedPurpose,
                      width: SizeConfig.blockSizeHorizontal * 80,
                      dropdownvalue: purpose,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropDownButtons(
                          hint: "Age in years",
                          onChanged: (newvalue) {
                            setState(() {
                              selecteddurationInAMonth = newvalue;
                            });
                          },
                          width: SizeConfig.blockSizeHorizontal * 37.5,
                          //   margin: 33,
                          selected: selecteddurationInAMonth,
                          dropdownvalue: durationInAMonth,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        DropDownButtons(
                          hint: "Housing",
                          onChanged: (newvalue) {
                            setState(() {
                              selectedPurpose = newvalue;
                            });
                          },
                          // margin: 33,
                          selected: selectedPurpose,
                          width: SizeConfig.blockSizeHorizontal * 35.5,
                          dropdownvalue: purpose,
                        ),
                      ],
                    ),
                    DropDownButtons(
                      hint: "Other installment plans",
                      onChanged: (newvalue) {
                        setState(() {
                          selectedPurpose = newvalue;
                        });
                      },
                      // margin: 33,
                      selected: selectedPurpose,
                      width: SizeConfig.blockSizeHorizontal * 80,
                      dropdownvalue: purpose,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropDownButtons(
                          hint: "Foreign worker",
                          onChanged: (newvalue) {
                            setState(() {
                              selecteddurationInAMonth = newvalue;
                            });
                          },
                          width: SizeConfig.blockSizeHorizontal * 35.5,
                          //   margin: 33,
                          marginLeft: 20,
                          selected: selecteddurationInAMonth,
                          dropdownvalue: durationInAMonth,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        DropDownButtons(
                          hint: "Telephone",
                          onChanged: (newvalue) {
                            setState(() {
                              selectedPurpose = newvalue;
                            });
                          },
                          // margin: 33,
                          selected: selectedPurpose,
                          width: SizeConfig.blockSizeHorizontal * 35.5,
                          dropdownvalue: purpose,
                        ),
                      ],
                    ),
                    DropDownButtons(
                      hint: "Number of existing credits at this bank",
                      onChanged: (newvalue) {
                        setState(() {
                          selectedPurpose = newvalue;
                        });
                      },
                      // margin: 33,
                      selected: selectedPurpose,
                      width: SizeConfig.blockSizeHorizontal * 80,
                      dropdownvalue: purpose,
                    ),
                    DropDownButtons(
                      margintop: false,
                      onChanged: (newvalue) {
                        setState(() {
                          selectedStatus = newvalue;
                        });
                      },
                      title:
                          "Number of people being liable to provide maintenance for",
                      hint: "1",
                      width: SizeConfig.blockSizeHorizontal * 80,
                      selected: selectedStatus,
                      dropdownvalue: statusOfCheckingAccount,
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 30, bottom: 50, left: 50, right: 50),
                width: Get.width * 0.85,
                height: 60,
                child: RaisedButton(
                  disabledColor: CustomColors.lightgray3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: CustomColors.blue,
                  onPressed: () async {
                    preferences = await SharedPreferences.getInstance();
                    setState(() {
                      preferences.setBool("computed", true);
                    });
                    Get.to(() => Home());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "compute",
                      style: TextStyle(color: CustomColors.white, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
