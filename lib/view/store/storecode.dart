import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:vibration/vibration.dart';

import 'storecode2.dart';

class StoreCode extends StatefulWidget {
  var service;
  StoreCode({this.service});
  @override
  _StoreCodeState createState() => _StoreCodeState();
}

class _StoreCodeState extends State<StoreCode> {
  String qR = "";
  String qr = "";
  bool camState = true;
  @override
  Widget build(BuildContext context) {
    print(widget.service);
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
                  "Scan QR code",
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Scan merchant's QR Code",
              style: TextStyle(fontSize: 20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: CustomColors.lightpurple,
                          blurRadius: 8,
                          spreadRadius: 2)
                    ],
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomPaint(
                          painter: qr.isEmpty ? MyCustomPaint() : NullPaint(),
                          child: Center(
                              child: qr.isEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                            child: Center(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.55,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // border: Border.all(
                                              //   color: Colors.blue,
                                              //   width: 3,
                                              // ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: QrCamera(
                                                fit: BoxFit.fitWidth,
                                                onError: (context, error) =>
                                                    Text(
                                                  error.toString(),
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                qrCodeCallback: (code) {
                                                  setState(() {
                                                    qr = code;
                                                  });
                                                  Vibration.vibrate(
                                                      duration: 200);
                                                },
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 13,
                                        ),
                                        Container(
                                          child: SvgPicture.asset(
                                              "assets/images/Group.svg"),
                                        ),
                                        SizedBox(
                                          height: 13,
                                        ),
                                        Text(
                                          "Foot Locker ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 13,
                                        ),
                                        Text("Confirm Credit"),
                                        SizedBox(
                                          height: 13,
                                        ),
                                        Text("Confirm to take"),
                                        SizedBox(
                                          height: 13,
                                        ),
                                        Text("5000 Br  credit from this store"),
                                        SizedBox(
                                          height: 13,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 50,
                                              right: 50),
                                          //       width: MediaQuery.of(context).size.width * 0.70,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              primary: CustomColors.blue,
                                            ),
                                            //    disabledColor: CustomColors.lightgray3,

                                            onPressed: () async {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return StoreCode2(
                                                      service: widget.service);
                                                },
                                              ));
                                              // String x = await scanQR();
                                              // setState(() {
                                              //   qR = x;
                                              // });
                                              //  Get.off(() => CreditScoringForm());
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Confirm",
                                                style: TextStyle(
                                                  color: CustomColors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Your credit score will be 574 after applying to this credit ",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: CustomColors.lightgray2),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "learn more",
                                              style: TextStyle(
                                                  color: CustomColors.blue),
                                            ))
                                      ],
                                    )),
                        ),
                      ),
                      //  qR.isEmpty
                      // ? Container(
                      //     margin: EdgeInsets.only(
                      //         top: 50, bottom: 20, left: 50, right: 50),
                      //     //       width: MediaQuery.of(context).size.width * 0.70,
                      //     height: 40,
                      //     child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius:
                      //                 BorderRadius.circular(30)),
                      //         primary: CustomColors.blue,
                      //       ),
                      //       //    disabledColor: CustomColors.lightgray3,

                      //       onPressed: () async {
                      //         String x = await scanQR();
                      //         if (x.isNotEmpty) {
                      //           Vibration.vibrate(duration: 200);
                      //           setState(() {
                      //             qR = x;
                      //           });
                      //         }

                      //         //  Get.off(() => CreditScoringForm());
                      //       },
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         child: Text(
                      //           "Scan",
                      //           style: TextStyle(
                      //             color: CustomColors.white,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   )
                      // : Container(
                      //     width: 0,
                      //     height: 0,
                      //   ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.6,
                )
              ],
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

  // scanQR() async {
  //   if (await Permission.camera.request().isGranted) {
  //     return await FlutterBarcodeScanner.scanBarcode(
  //         "#000000", "Cancel", true, ScanMode.QR);
  //   }
  // }
}

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint()
      ..color = Color(0xFF2334D0)
      ..strokeWidth = 5.0;
    //the topleft horizonatal line
    Offset startingPoint = Offset(size.width * 0.045, size.height * 0.1);
    Offset endingPoint = Offset(size.width * 0.15, size.height * 0.1);

    canvas.drawLine(startingPoint, endingPoint, paint);

    //the topleft vertical line
    Offset startingPoint1 = Offset(size.width * 0.05, size.height * 0.1);
    Offset endingPoint2 = Offset(size.width * 0.05, size.height * 0.2);

    canvas.drawLine(startingPoint1, endingPoint2, paint);

    //the topright horizonatal line
    Offset startingPoint3 = Offset(size.width * 0.83, size.height * 0.1);
    Offset endingPoint3 = Offset(size.width * 0.94, size.height * 0.1);

    canvas.drawLine(startingPoint3, endingPoint3, paint);

    //the topright vertical line
    Offset startingPoint4 = Offset(size.width * 0.935, size.height * 0.1);
    Offset endingPoint4 = Offset(size.width * 0.935, size.height * 0.2);

    canvas.drawLine(startingPoint4, endingPoint4, paint);

    //the bottomleft horizonatal line
    Offset startingPoint5 = Offset(size.width * 0.045, size.height * 0.9);
    Offset endingPoint5 = Offset(size.width * 0.15, size.height * 0.9);

    canvas.drawLine(startingPoint5, endingPoint5, paint);

    //the bottomleft vertical line
    Offset startingPoint6 = Offset(size.width * 0.05, size.height * 0.8);
    Offset endingPoint6 = Offset(size.width * 0.05, size.height * 0.9);

    canvas.drawLine(startingPoint6, endingPoint6, paint);

    //the bottomright horizonatal line
    Offset startingPoint7 = Offset(size.width * 0.83, size.height * 0.9);
    Offset endingPoint7 = Offset(size.width * 0.94, size.height * 0.9);

    canvas.drawLine(startingPoint7, endingPoint7, paint);
//the bottom right vertical line
    Offset startingPoint8 = Offset(size.width * 0.935, size.height * 0.8);
    Offset endingPoint8 = Offset(size.width * 0.935, size.height * 0.9);

    canvas.drawLine(startingPoint8, endingPoint8, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class NullPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
