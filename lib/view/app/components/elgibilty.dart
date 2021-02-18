import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ligmone/constants/Colors.dart';

class Eligibility extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,

        //    color: Colors.white,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10).copyWith(left: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: CustomColors.darkgray, blurRadius: 10)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomColors.chart),
              height: 70,
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "98%",
                    style: TextStyle(
                        fontSize: 22,
                        color: CustomColors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Text(
                    "Mortgage Eligibility ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 50,
                child: Image.asset(
                  "assets/images/chart.png",
                  fit: BoxFit.cover,
                ))
          ],
        ));
  }
}
