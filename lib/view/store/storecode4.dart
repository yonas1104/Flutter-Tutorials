import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/store/store.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:math' as math;
import 'storecode2.dart';

class StoreCode4 extends StatefulWidget {
  var service;
  StoreCode4({this.service});
  @override
  _StoreCode4State createState() => _StoreCode4State();
}

class _StoreCode4State extends State<StoreCode4> {
  String qR = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                "assets/images/leftarrow.svg",
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Recipent",
                  style: TextStyle(color: CustomColors.blue),
                ),
              ),
            ),
          ],
        ),
        // actions: [
        //   SvgPicture.asset(
        //     "assets/images/search.svg",
        //     height: 30,
        //   ),
        // ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Container(
              width: 300,
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: CustomColors.lightpurple2,
                      blurRadius: 8,
                      spreadRadius: 2),
                  // BoxShadow(
                  //     color: CustomColors.lightpurple,
                  //     blurRadius: 8,
                  //     spreadRadius: 2)
                ],
              ),
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  clipBehavior: Clip.none,
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      // BoxShadow(
                      //     color: CustomColors.lightpurple,
                      //     blurRadius: 8,
                      //     spreadRadius: 2),
                      // BoxShadow(
                      //     color: CustomColors.lightpurple,
                      //     blurRadius: 8,
                      //     spreadRadius: 2)
                    ],
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 150,
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
                                    height: 150,
                                    width: 180,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        widget.service['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                Positioned(
                                  top: 100,
                                  //         left: 0,
                                  child: Container(
                                    width: 160.5,
                                    height: 50,
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
                                      margin: EdgeInsets.only(left: 20),
                                      height: 35,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(widget.service['name']),
                                            Transform(
                                              alignment: Alignment.center,
                                              transform:
                                                  Matrix4.rotationY(math.pi),
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
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            "Starbucks Coffee",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            "Credit Recipent",
                            style: TextStyle(
                                fontSize: 20, color: CustomColors.lightgray3),
                          ),
                          Container(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Credit amount",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: CustomColors.darkgray),
                                    ),
                                    Text(
                                      "3,500 Br",
                                      style: TextStyle(
                                          color: CustomColors.lightgray3),
                                    ),
                                    Text("Status"),
                                    Text(
                                      "Pending",
                                      style: TextStyle(
                                          color: CustomColors.pending),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Installment pan",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: CustomColors.darkgray),
                                    ),
                                    Text(
                                      "4 months",
                                      style: TextStyle(
                                          color: CustomColors.lightgray3),
                                    ),
                                    Text("Remaining"),
                                    Text("1,250 Br"),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                            return Store();
                          },
                        ));
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
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [CustomColors.white, CustomColors.servicesbackground])),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //final size = rect.size;
    final double width = 50;
    final double depth = 30;
    var path = Path()
      ..lineTo(size.width / 2 - width / 2, 0)
      ..relativeQuadraticBezierTo(width / 2, depth, width, 0)
      ..lineTo(size.width, 0)

      /// right
      ..lineTo(size.width, size.height / 4 - width / 2)
      ..relativeQuadraticBezierTo(-depth, width / 2, 0, width)
      ..lineTo(size.width, size.height / 4)
      ..lineTo(size.width, size.height * 0.8 - width / 2)
      ..relativeQuadraticBezierTo(-depth, width / 2, 0, width)
      ..lineTo(size.width, size.height)

      /// bottom
      ..lineTo(size.width / 2 + width / 2, size.height)
      //  ..relativeQuadraticBezierTo(-width / 2, -depth, -width, 0)
      ..lineTo(0, size.height)

      /// left
      ..lineTo(0, size.height / 3 - width / 2)
      ..relativeQuadraticBezierTo(depth, -width / 2, 0, -width)
      ..lineTo(0, size.height / 4)
      ..lineTo(0, size.height * 0.9 - width / 2)
      ..relativeQuadraticBezierTo(depth, -width / 2, 0, -width)
      //  ..lineTo(size.width, size.height)

      // ..lineTo(0, size.height / 2 + width / 2)
      // ..relativeQuadraticBezierTo(depth, -width / 2, 0, -width)
      ..lineTo(0, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip

    return true;
  }
}
