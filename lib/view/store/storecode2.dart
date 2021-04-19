import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/store/components/buttons.dart';
import 'package:ligmone/view/store/storecode3.dart';
import 'package:permission_handler/permission_handler.dart';

import 'storecode.dart';

class StoreCode2 extends StatefulWidget {
  var service;
  StoreCode2({this.service});
  @override
  _StoreCode2State createState() => _StoreCode2State();
}

class _StoreCode2State extends State<StoreCode2> {
  List name = [
    "INSTALLMENT PAYMENT",
    "PAY AFTER 30 DAYS",
    "FINANCE THE PAYMENT",
  ]; //l
  List selectedElementList = []; //selected item list

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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Choose payment terms",
                  style: TextStyle(fontSize: 20),
                )),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.6,
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Buttons(
                        child: name[index],
                        isSelected: selectedElementList.contains(name[
                            index]), // check if the current button is in selected element list and sends bool value
                        onPressed: () {
                          setState(() {
                            selectedElementList.clear();

                            selectedElementList.add(name[index]);
                          });
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DiscountCode3(
                                service: widget.service,
                              );
                            },
                          ));
                        },
                      ),
                    );
                  }),
            ),
            Spacer(),
            Container(
              height: 150,
              margin: EdgeInsets.only(
                top: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        "Learn more about payment terms",
                        style: TextStyle(color: CustomColors.lightgray3),
                      )),
                  // Container(
                  //   width: 350,
                  //   margin: EdgeInsets.only(top: 10),
                  //   child: Text(
                  //     "Learn more about payment terms",
                  //     style: TextStyle(color: CustomColors.lightpurple),
                  //   ),
                  // ),
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
                            return StoreCode();
                          },
                        ));
                        //  Get.off(() => CreditScoringForm());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Help me to decide",
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
