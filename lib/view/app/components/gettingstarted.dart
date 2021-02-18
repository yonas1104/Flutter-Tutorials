import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/app/components/Guage.dart';

class GettingStarted extends StatelessWidget {
  String title;

  String description;

  int index;

  GettingStarted({this.title, this.description, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10).copyWith(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  //  /   spreadRadius: 1,
                  blurRadius: 20,
                  //  offset: Offset(10, 5),
                  color: CustomColors.lightpurple)
            ]),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.,
          children: [
            SizedBox(
              height: 20,
            ),
            index == 0
                ? Guage(
                    height: 120,
                    markerheight: 20,
                    textsize1: 25,
                    textsize2: 10,
                  )
                : Container(
                    height: 150,
                    width: 0,
                  ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Text(
                title,
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                description,
                style: TextStyle(fontSize: 15, color: CustomColors.lightgray3),
              ),
            ),
          ],
        ));
  }
}
