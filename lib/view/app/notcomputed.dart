import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/SizeConfig.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/FirstTime/creditscoringform.dart';
import 'package:ligmone/view/FirstTime/registerationsuccess.dart';
import 'package:ligmone/view/app/components/bankcampiagns.dart';
import 'package:ligmone/view/app/components/gettingstarted.dart';

import 'package:ligmone/view/app/components/typesofloans.dart';
import 'package:ligmone/view/app/components/updatedpolicies.dart';
import 'package:ligmone/view/app/home.dart';
import 'package:ligmone/view/app/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loancritriacalculator.dart';

//Home page

class NotComputed extends StatefulWidget {
  NotComputed({Key key}) : super(key: key);

  @override
  _NotComputedState createState() => _NotComputedState();
}

class _NotComputedState extends State<NotComputed>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    checkComputed();
    super.initState();

    _pageController = PageController();
  }

  //int _selectedIndex = 0;
  List imagepath = [
    "assets/images/cost.svg",
    "assets/images/growth.svg",
    "assets/images/exchange2.svg",
    "assets/images/wallet.svg"
  ]; //image paths
  List type = [
    "Personal Loan",
    "Automobile Loan",
    "Mortgage Loan",
    "Diaspora Loan"
  ];
  List title = ["What is credit scoring", "Best loan management practices"];
  List description = [
    "Learn how you can benefit from credit scoring and how calculating your credit score helps you",
    "Learn the best loan managmnet practices",
  ];
  List bankcampaigntitle = [
    "Awash bank is increasing interests on deposits",
    "Abay Bank is starting a  new diaspora camapign"
  ];
  List updatedpoliciestitle = [
    "CBE is launching a new Loan processing syastem",
    "National Bank Of Ethiopiaupdated the ILMS document"
  ];
  List updatedpoliciesdescription = [
    "Learn all about commercial bank of Ethiopia's new online document validator",
    "NBE has announces the new international loan management."
  ];
  SharedPreferences preferences;
  bool computed = false;
  checkComputed() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      computed = preferences.get("computed");
      if (computed == null) {
        computed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _currentIndex ==
              0 // used for now showing the app bar on the next screen of bottom navigation bar
          ? AppBar(
              leading: Container(
                height: 0,
                width: 0,
              ),
              title: Text(
                "Ligmone",
                style: TextStyle(
                    color: CustomColors.blue,
                    fontFamily: "Rockwellr",
                    fontWeight: FontWeight.bold),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            )
          : null,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            !computed
                ? SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              CustomColors.white,
                              CustomColors.homebackground
                            ])),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 50, bottom: 20, left: 50, right: 50),
                              width: SizeConfig.blockSizeHorizontal * 70,
                              height: 60,
                              child: RaisedButton(
                                disabledColor: CustomColors.lightgray3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: CustomColors.blue,
                                onPressed: () {
                                  Get.off(() => CreditScoringForm());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Calculate your credit score",
                                    style: TextStyle(
                                        color: CustomColors.white,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 4),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 0, left: 20, bottom: 30, right: 49),
                              child: Text(
                                "Calculate your credit score and know your the servicesthat are available to you. Take our word for it, it will surprise you. ",
                                style: TextStyle(
                                    color: CustomColors.lightgray3,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "Take Action",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 21,
                              child: ListView.builder(
                                  itemCount: 4,
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return TypesOfLoan(
                                      //types of loans represented by cards
                                      type: type[index],
                                      imagepath: imagepath[index],
                                    );
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 40),
                              child: Text(
                                "Important articles for you",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0, bottom: 10),
                              child: Text(
                                "Geting started",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Container(
                              //Getting started represented by cards

                              height: SizeConfig.blockSizeHorizontal * 65,
                              child: ListView.builder(
                                  itemCount: 2,
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GettingStarted(
                                      index: index,
                                      title: title[index],
                                      description: description[index],
                                    );
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                "Bank Campaigns",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Container(
                              //Bank campaigns represented by cards

                              height: SizeConfig.blockSizeHorizontal * 65,
                              child: ListView.builder(
                                  itemCount: 2,
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return BankCampaigns(
                                      title: bankcampaigntitle[index],
                                    );
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20, right: 200, bottom: 20),
                              child: Text(
                                "Recently updated policies",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Container(
                              //updated policies represented by cards
                              height: SizeConfig.blockSizeHorizontal * 65,
                              child: ListView.builder(
                                  itemCount: 2,
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return UpdatedPolices(
                                      title: updatedpoliciestitle[index],
                                      description:
                                          updatedpoliciesdescription[index],
                                    );
                                  }),
                            ),
                          ],
                        )),
                  )
                : Home(),
            Transaction(),
            Transaction(),
            RegistrationSuccess(),

            //transaction graph page
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
              icon: SvgPicture.asset("assets/images/home.svg"),
              title: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 2),
                child: Text("Home"),
              )),
          BottomNavyBarItem(
              icon: SvgPicture.asset("assets/images/menuitem2.svg"),
              title: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 2),
                child: Text("Credit"),
              )),
          BottomNavyBarItem(
              icon: SvgPicture.asset("assets/images/menuitem3.svg"),
              title: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 2),
                child: Text("Money"),
              )),
          BottomNavyBarItem(
              icon: SvgPicture.asset("assets/images/menuitem4.svg"),
              title: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 2),
                child: Text("Account"),
              )),
        ],
      ),
    );
  }
}
