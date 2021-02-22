import 'package:flutter/material.dart';
import 'package:ligmone/constants/Colors.dart';

import '../../../SizeConfig.dart';

//updated policies represented by cards
class UpdatedPolices extends StatelessWidget {
  String title;

  String description;

  int index;

  UpdatedPolices({this.title, this.description, this.index});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.blockSizeHorizontal * 65,
        margin: EdgeInsets.all(10).copyWith(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: CustomColors.lightpurple)
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 50,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 50,
              //   alignment: Alignment.center,
              // margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                description,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                    color: CustomColors.lightgray3),
              ),
            ),
          ],
        ));
  }
}
