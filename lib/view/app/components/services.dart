import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 150,
      child: ListView.builder(
          clipBehavior: Clip.none,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
                width: 210,
                height: 10,
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
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            "9%",
                            style: TextStyle(
                                color: CustomColors.blue, fontSize: 30),
                          ),
                          Text(
                            "Interest",
                            style: TextStyle(
                                color: CustomColors.blue, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.all(10).copyWith(top: 0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 55),
                            child: Text(
                              "Awash Bank",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Text(
                            "Personal loan",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Rockwellr",
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ));
          }),
    );
  }
}
