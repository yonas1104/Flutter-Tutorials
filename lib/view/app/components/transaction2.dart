import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';

class Transaction2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Banks",
                  style: TextStyle(color: CustomColors.lightgray3),
                ),
                Text(
                  "Loan Type",
                  style: TextStyle(color: CustomColors.lightgray3),
                ),
                Text(
                  "Bank Equty Cotribution",
                  style: TextStyle(color: CustomColors.lightgray3),
                )
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.lightgray,
                    blurRadius: 20,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "CBE",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Personal Loan",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "21%",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Abyssinia ",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mortgage  Loan",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "34%",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Dashen",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Vehicle Loan",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "11%",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Rockwellr",
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
