import 'package:flutter/material.dart';
import 'package:ligmone/constants/Colors.dart';

import 'Guage.dart';

class BankCampaigns extends StatelessWidget {
  String title;

  String description;

  int index;

  BankCampaigns({this.title, this.description, this.index});
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              width: 240,
              alignment: Alignment.center,
              // margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ));
  }
}
