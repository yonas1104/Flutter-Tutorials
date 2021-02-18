import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/welcome/welcome2.dart';

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
                  Get.off(Welcome2());
                },
                duration: Duration(milliseconds: 1000),
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "\"Hi",
                    style: TextStyle(
                        color: CustomColors.blue,
                        fontSize: 50,
                        fontStyle: FontStyle.italic,
                        fontFamily: "Rockwellr",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SvgPicture.asset("assets/images/welcome.svg")
            ],
          ),
        ),
      ),
    );
  }
}
