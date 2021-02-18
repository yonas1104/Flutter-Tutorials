import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/Authentication/components/numberbutton.dart';
import 'package:ligmone/view/FirstTime/registerationsuccess.dart';

class LocalAuth extends StatefulWidget {
  @override
  _LocalAuthState createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  int number = 0;
  String code = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (number == 4) {
    //   Get.off(() => RegistrationSuccess());
    // }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.5, 0.9],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [CustomColors.white, CustomColors.lightpurple])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Continue with face ID",
              style: TextStyle(color: CustomColors.blue),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        boxShadow: [],
                        shape: BoxShape.circle,
                        color: number >= 1
                            ? CustomColors.blue
                            : CustomColors.lightgray2),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        boxShadow: [],
                        shape: BoxShape.circle,
                        color: number >= 2
                            ? CustomColors.blue
                            : CustomColors.lightgray2),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        boxShadow: [],
                        shape: BoxShape.circle,
                        color: number >= 3
                            ? CustomColors.blue
                            : CustomColors.lightgray2),
                  ),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        boxShadow: [],
                        shape: BoxShape.circle,
                        color: number >= 4
                            ? CustomColors.blue
                            : CustomColors.lightgray2),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: "1",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 1.toString();
                        number = number + 1;
                      });
                    }
                  },
                ),
                NumberButton(
                  number: "2",
                  letters: "ABC",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 2.toString();
                        number = number + 1;
                      });
                    }
                  },
                ),
                NumberButton(
                  number: "3",
                  letters: "DEF",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 3.toString();
                        number = number + 1;
                      });
                    }
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: "4",
                  letters: "GHI",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 4.toString();
                        number = number + 1;
                      });
                    }
                  },
                ),
                NumberButton(
                  number: "5",
                  letters: "JKL",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 5.toString();
                        number = number + 1;
                      });
                    }
                  },
                ),
                NumberButton(
                  number: "6",
                  letters: "MNO",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 6.toString();
                        number = number + 1;
                      });
                    }
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: "7",
                  letters: "PQRS",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 7.toString();
                        number = number + 1;
                      });
                    }
                  },
                ),
                NumberButton(
                  number: "8",
                  letters: "TUV",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 8.toString();
                        number = number + 1;
                      });
                    }
                  },
                ),
                NumberButton(
                  number: "9",
                  letters: "WXYZ",
                  onPressed: () {
                    if (number < 4) {
                      setState(() {
                        code = code + 9.toString();
                        number = number + 1;
                      });
                    }
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 30,
                ),
                NumberButton(
                  number: "0",
                  onPressed: () {
                    Get.off(() => RegistrationSuccess());
                    if (number < 4) {
                      setState(() {
                        code = code + 0.toString();
                        number = number + 1;
                      });
                    }
                  },
                ),
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              // if (number == 0) {
                              //   setState(() {
                              //     code = null;
                              //     code = "";
                              //     number = 0;
                              //   });
                              // }
                              if (number >= 1) {
                                Get.snackbar("asdasd", code);
                                setState(() {
                                  if ((code != null) && (code.length > 0)) {
                                    code = code.substring(0, code.length - 1);
                                  }
                                  number--;
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(10),
                            child:
                                SvgPicture.asset("assets/images/erase.svg"))))
              ],
            )
          ],
        ),
      ),
    );
  }
}
