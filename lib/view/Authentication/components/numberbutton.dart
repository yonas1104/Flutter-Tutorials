import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';

class NumberButton extends StatelessWidget {
  String number;
  String letters;
  Function onPressed;
  NumberButton({this.number, this.letters, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 80,
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 90,
              offset: Offset(2, 4),
              color: CustomColors.lightpurple)
        ], shape: BoxShape.circle, color: CustomColors.white),
        child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: InkWell(
              radius: 120,
              borderRadius: BorderRadius.circular(50),
              onTap: onPressed,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    number,
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Rockwellr",
                        fontWeight: FontWeight.bold,
                        color: CustomColors.blue),
                  ),
                  !number.contains("1") && !number.contains("0")
                      ? Text(
                          letters,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Rockwellr",
                              color: CustomColors.blue),
                        )
                      : Container(),
                ],
              )),
            )));
  }
}
