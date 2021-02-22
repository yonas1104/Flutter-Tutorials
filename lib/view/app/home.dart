import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/app/components/Guage.dart';
import 'package:ligmone/view/app/components/services.dart';
import 'package:ligmone/view/app/components/suggestions.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

//Home page of the app

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [CustomColors.white, CustomColors.homebackground])),
          child: CustomScrollView(slivers: [
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Container(margin: EdgeInsets.only(top: 10), child: Guage()),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                  child: Text(
                    "This credit score is computed based on your credit profile. ",
                    style: TextStyle(color: CustomColors.lightgray3),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                  child: Text(
                    "Services available for you",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, right: 40, left: 20, bottom: 10),
                  child: Text(
                    "Based on your credit score, the following sercices are available for you",
                    style: TextStyle(color: CustomColors.lightgray3),
                  ),
                ),
                Services(),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 30, bottom: 0),
                  child: Text(
                    "Suggestions for you",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 30, bottom: 10),
                  child: Text(
                    "Based on your credit score",
                    style: TextStyle(color: CustomColors.lightgray3),
                  ),
                ),
              ],
            )),
            Suggesstions()
          ]),
        ),
      ),
    );
  }
}
