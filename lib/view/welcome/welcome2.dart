import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/Authentication/signup.dart';
import 'package:ligmone/view/welcome/carousel.dart';

class Welcome2 extends StatefulWidget {
  @override
  _Welcome2State createState() => _Welcome2State();
}

class _Welcome2State extends State<Welcome2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
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
            Carousel(),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.13, left: 190),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-25, 0),
                      color: CustomColors.lightpurple,
                    )
                  ],
                  color: CustomColors.blue,
                  borderRadius: BorderRadius.circular(50)),
              width: 140,
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
      ),
    ));
  }
}
