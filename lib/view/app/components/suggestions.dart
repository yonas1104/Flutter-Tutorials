import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';

class Suggesstions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: CustomColors.lightpurple, blurRadius: 10)
              ]),
          height: 300,
          child: Column(children: [
            SizedBox(
                child: Image.asset(
              "assets/images/abaybank.png",
            )),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: 350,
              child: Text(
                "You can take a mortgage loan from awash band for 14% of interest rate",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5,
              ),
              alignment: Alignment.bottomCenter,
              width: 350,
              child: TextButton(
                onPressed: () {},
                child: Text("Show more about this deal",
                    style: TextStyle(fontSize: 15, color: CustomColors.blue)),
              ),
            ),
          ]),
        );
      }, childCount: 10
          // primary: false,
          // //  shrinkWrap: true,
          // //  physics: NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.vertical,
          // // clipBehavior: Clip.none,
          // // shrinkWrap: true,
          // itemCount: 15,
          // itemBuilder: (context, index) {

          ),
    );
  }
}
