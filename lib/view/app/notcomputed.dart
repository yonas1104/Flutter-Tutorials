import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/SizeConfig.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/app/components/Guage.dart';
import 'package:ligmone/view/app/components/bankcampiagns.dart';
import 'package:ligmone/view/app/components/gettingstarted.dart';
import 'package:ligmone/view/app/components/services.dart';
import 'package:ligmone/view/app/components/suggestions.dart';
import 'package:ligmone/view/app/components/typesofloans.dart';
import 'package:ligmone/view/app/components/updatedpolicies.dart';
import 'package:ligmone/view/app/transaction.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'loancritriacalculator.dart';

class NotComputed extends StatefulWidget {
  NotComputed({Key key}) : super(key: key);

  @override
  _NotComputedState createState() => _NotComputedState();
}

class _NotComputedState extends State<NotComputed>
    with TickerProviderStateMixin {
  TabController _controller;
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _pageController = PageController();
  }

  @override
  int _selectedIndex = 0;
  List imagepath = [
    "assets/images/cost.svg",
    "assets/images/growth.svg",
    "assets/images/exchange2.svg",
    "assets/images/wallet.svg"
  ];
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

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
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
            SingleChildScrollView(
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
                            Get.to(() => LoanCriteriaCalculator());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Calculate your credit score",
                              style: TextStyle(
                                  color: CustomColors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      //   Container(margin: EdgeInsets.only(top: 10), child: Guage()),
                      Container(
                        margin: EdgeInsets.only(
                            top: 0, left: 20, bottom: 30, right: 49),
                        child: Text(
                          "Calculate your credit score and know your the servicesthat are available to you. Take our word for it, it will surprise you. ",
                          style: TextStyle(
                              color: CustomColors.lightgray3,
                              fontSize: SizeConfig.blockSizeHorizontal * 2.5),
                        ),
                      ),
                      Container(
                        //alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Take Action",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),

                      Container(
                        //   margin: EdgeInsets.only(left: ),
                        //     alignment: Alignment.center,
                        height: SizeConfig.blockSizeVertical * 20,
                        child: ListView.builder(
                            itemCount: 4,
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return TypesOfLoan(
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
                        // alignment: Alignment.center,
                        height: SizeConfig.blockSizeHorizontal * 50,
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
                        // alignment: Alignment.center,
                        height: SizeConfig.blockSizeHorizontal * 50,
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
                        margin:
                            EdgeInsets.only(top: 20, right: 200, bottom: 20),
                        child: Text(
                          "Recently updated policies",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Container(
                        // alignment: Alignment.center,
                        height: SizeConfig.blockSizeHorizontal * 50,
                        child: ListView.builder(
                            itemCount: 2,
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return UpdatedPolices(
                                title: updatedpoliciestitle[index],
                                description: updatedpoliciesdescription[index],
                              );
                            }),
                      ),
                    ],
                  )),
            ),
            Transaction()
          ],
        ),
      ),
      //  TabBarView(
      //   controller: _controller,
      //   children: [

      // ]),

      //   backgroundColor: Colors.white,
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
                child: Text("Page 2"),
              )),
          BottomNavyBarItem(
              icon: SvgPicture.asset("assets/images/menuitem3.svg"),
              title: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 2),
                child: Text("Page 3"),
              )),
          BottomNavyBarItem(
              icon: SvgPicture.asset("assets/images/menuitem4.svg"),
              title: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 2),
                child: Text("Page 4"),
              )),
        ],
      ),
    );
  }
}
