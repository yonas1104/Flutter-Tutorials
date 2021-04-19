import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/store/storecode4.dart';

class DiscountCode3 extends StatelessWidget {
  var service;
  DiscountCode3({this.service});

  @override
  Widget build(BuildContext context) {
    print(service);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "assets/images/leftarrow.svg",
            fit: BoxFit.cover,
            height: 30,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [CustomColors.white, CustomColors.servicesbackground])),
        child: Column(
          children: [
            Container(
              width: 200,
              // decoration: BoxDecoration(
              //     color: Colors.white, borderRadius: BorderRadius.circular(100)
              //     // boxShadow: [
              //     //   BoxShadow(color: Colors.grey, blurRadius: 1)
              //     // ],
              //     ),
              child: Stack(
                children: [
                  Container(

                      // margin: EdgeInsets.only(top: 10),
                      height: 170,
                      width: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          service['image'],
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                    top: 110,
                    left: 0,
                    child: Container(
                      width: 174.5,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150))
                          // boxShadow: [
                          //   BoxShadow(color: Colors.grey, blurRadius: 1)
                          // ],
                          ),
                      child: Container(
                        margin: EdgeInsets.only(left: 50),
                        height: 35,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(service['name']),
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: SvgPicture.asset(
                                  "assets/images/leftarrow.svg",
                                  height: 20,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Installment plan",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "  Choose installment plan",
                style: TextStyle(fontSize: 15, color: CustomColors.lightgray3),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                " 3,500 Br in 4 months installment",
                style: TextStyle(fontSize: 20, color: CustomColors.darkgray),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("1 month"),
                Text("2 month"),
                Text("3 month"),
                Text("4 month")
              ],
            ),
            SvgPicture.asset(
              "assets/images/Union 1.svg",
              width: 350,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("500 birr"),
                Text("500 birr"),
                Text("1200 birr"),
                Text("1300 birr")
              ],
            ),
            Spacer(),
            Spacer(),
            Container(
              height: 120,
              margin: EdgeInsets.only(
                top: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 50, right: 50),
                    //       width: MediaQuery.of(context).size.width * 0.70,
                    height: 45,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: CustomColors.blue,
                      ),
                      //    disabledColor: CustomColors.lightgray3,

                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return StoreCode4(service: service);
                          },
                        ));
                        //  Get.off(() => CreditScoringForm());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Finish",
                          style: TextStyle(
                            color: CustomColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
            ),
            // Container(
            //   color: Colors.transparent,
            //   width: MediaQuery.of(context).size.width,
            //   height: 100,
            //   child: Stepper(
            //     type: StepperType.horizontal,
            //     // controlsBuilder: (context, {onStepCancel, onStepContinue}) {
            //     //   return Column(
            //     //     children: [
            //     //       Container(
            //     //         height: 10,
            //     //         width: 10,
            //     //         child: Text("Asd"),
            //     //       ),
            //     //     ],
            //     //
            //     //   );
            //     // },

            //     steps: [
            //       Step(
            //         state: StepState.complete,
            //         title: Text("1 month"),
            //         subtitle: Text("500 birr"),
            //         content: Container(),
            //       ),
            //       Step(
            //         title: Text("2 month"),
            //         content: Container(),
            //         subtitle: Text("500 birr"),
            //       ),
            //       Step(
            //         title: Text("3 month"),
            //         content: Container(),
            //         subtitle: Text("1200 birr"),
            //       ),
            //       Step(
            //         title: Text("4 month"),
            //         content: Container(),
            //         subtitle: Text("1300 birr"),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
