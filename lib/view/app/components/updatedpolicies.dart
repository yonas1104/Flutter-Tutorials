import 'package:flutter/material.dart';
import 'package:ligmone/constants/Colors.dart';

import '../../../SizeConfig.dart';

class UpdatedPolices extends StatelessWidget {
  String title;

  String description;

  int index;

  UpdatedPolices({this.title, this.description, this.index});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.blockSizeHorizontal * 50,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 40,
              alignment: Alignment.center,
              // margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                ),
              ),
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 40,
              alignment: Alignment.center,
              // margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                description,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                    color: CustomColors.lightgray3),
              ),
            ),
          ],
        ));
  }
}
