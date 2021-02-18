import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;

  var items = [
    "Credit Scoring Made Easy",
    "Take Control of Your Credit",
    "Get Matched With Personalized Offers"
  ];

  var details = [
    "check your free credit scores on the go",
    "Check your scores within every bank and get access to your reports in realtime ",
    "Know which bank is a great fir for loan and credit service  you are more likely to get approved for"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(-20, 0),
                color: CustomColors.lightpurple,
              )
            ],
            color: CustomColors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(100),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(50),
            )),
        width: Get.width * 0.85,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 300.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: items
                  .map((item) => Container(
                        //    padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/exchange.svg",
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 290,
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 300,
                              child: Text(
                                details[items.indexOf(item)],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.map((item) {
                int index = items.indexOf(item);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? CustomColors.white
                          : CustomColors.lightpurple),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
