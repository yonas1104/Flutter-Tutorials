import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/SizeConfig.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/Authentication/signup.dart';
import 'package:ligmone/view/welcome/carousel.dart';

//This is the second welcome screen which has carousel slider giving some tips about the app

class Welcome2 extends StatefulWidget {
  @override
  _Welcome2State createState() => _Welcome2State();
}

class _Welcome2State extends State<Welcome2> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 30, bottom: 10),
            child: Text(
              "and",
              style: TextStyle(
                  color: CustomColors.blue,
                  fontSize: 35,
                  //    fontFamily: "Rockwellr",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 30, bottom: 50),
            child: Text(
              "welcome!",
              style: TextStyle(
                  color: CustomColors.blue,
                  fontSize: 35,
                  //    fontFamily: "Rockwellr",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Carousel(), //different class for the carousel slider
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
                left: SizeConfig.blockSizeHorizontal * 45),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-25, 0),
                    color: CustomColors.lightpurple2,
                  )
                ],
                color: CustomColors.blue,
                borderRadius: BorderRadius.circular(50)),
            width: SizeConfig.blockSizeHorizontal * 30,
            height: 60,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: CustomColors.blue,
              onPressed: () {
                Get.off(SignUp());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Next",
                      style: TextStyle(color: CustomColors.white),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/images/rightarrow.svg",
                    color: CustomColors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
