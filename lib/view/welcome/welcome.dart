import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/SizeConfig.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/welcome/welcome2.dart';

//this is the very first screen on the app

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  double opacity = 0.0;
  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  //a method for making smooth animation for the text Hi to change opacity from 0 to 1
  changeOpacity() {
    Future.delayed(Duration(milliseconds: 00), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        // changeOpacity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedOpacity(
                opacity: opacity,
                onEnd: () {
                  Get.off(() => Welcome2());
                },
                duration: Duration(milliseconds: 1000),
                child: Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
                  child: Text(
                    "\"Hi",
                    style: TextStyle(
                        color: CustomColors.blue,
                        fontSize: SizeConfig.blockSizeHorizontal * 10,
                        fontStyle: FontStyle.italic,
                        fontFamily: "Rockwellr",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 12,
              ),
              SvgPicture.asset(
                "assets/images/welcome.svg",
                height: 400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
