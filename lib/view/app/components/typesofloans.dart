import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ligmone/constants/Colors.dart';

class TypesOfLoan extends StatelessWidget {
  String imagepath;
  String type;
  TypesOfLoan({this.imagepath, this.type, title, description});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10).copyWith(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(60),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  //  /   spreadRadius: 1,
                  blurRadius: 20,
                  //  offset: Offset(10, 5),
                  color: CustomColors.lightpurple)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imagepath,
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                type,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ));
  }
}
