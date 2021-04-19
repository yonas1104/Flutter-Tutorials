import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/store/storecode.dart';

class StoreDetail extends StatelessWidget {
  var service;
  StoreDetail({this.service});

  @override
  Widget build(BuildContext context) {
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      CustomColors.white,
                      CustomColors.servicesbackground
                    ])),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.84,
                child: CustomScrollView(
                  physics: ClampingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,

                      // Display a placeholder widget to visualize the shrinking size.
                      backgroundColor: Colors.transparent,
                      // Make the initial height of the SliverAppBar larger than normal.
                      expandedHeight: 350,

                      flexibleSpace: FlexibleSpaceBar(
                        // decoration: BoxDecoration(
                        //   color: Colors.transparent,
                        //   // boxShadow: [
                        //   //   BoxShadow(color: Colors.grey, blurRadius: 1)
                        //   // ],
                        // ),

                        //  width: 200,

                        background: Column(
                          children: [
                            Container(
                                color: Colors.red,
                                // margin: EdgeInsets.only(top: 10),
                                height: 160,
                                width: 200,
                                child: Image.asset(
                                  service['image'],
                                  fit: BoxFit.cover,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 130),
                              height: 60,
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
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "Starbucks Coffee",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: 350,
                              child: Text(
                                "You are eligible up to 5000 Br of credit in this shop",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.all(15).copyWith(left: 20),
                                child: Text(
                                  "Credit term",
                                  style: TextStyle(fontSize: 20),
                                )),
                            Container(
                              width: 350,
                              margin: EdgeInsets.all(1).copyWith(bottom: 60),
                              child: Text(
                                "In quo quaerimus, non fuisse torquem detraxit hosti et quidem exercitus quid ex ea commodi consequatur? quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut summo bono, dolorem ipsum, quia voluptas in liberos atque natum sit, aspernatur aut officiis debitis aut odit aut petat aut.In quo quaerimus, non fuisse torquem detraxit hosti et quidem exercitus quid ex ea commodi consequatur? quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut summo bono, dolorem ipsum, quia voluptas in liberos atque natum sit, aspernatur aut officiis debitis aut odit aut petat aut.In quo quaerimus, non fuisse torquem detraxit hosti et quidem exercitus quid ex ea commodi consequatur? quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut summo bono, dolorem ipsum, quia voluptas in liberos atque natum sit, aspernatur aut officiis debitis aut odit aut petat aut.In quo quaerimus, non fuisse torquem detraxit hosti et quidem exercitus quid ex ea commodi consequatur? quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut summo bono, dolorem ipsum, quia voluptas in liberos atque natum sit, aspernatur aut officiis debitis aut odit aut petat aut.In quo quaerimus, non fuisse torquem detraxit hosti et quidem exercitus quid ex ea commodi consequatur? quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut summo bono, dolorem ipsum, quia voluptas in liberos atque natum sit, aspernatur aut officiis debitis aut odit aut petat aut.In quo quaerimus, non fuisse torquem detraxit hosti et quidem exercitus quid ex ea commodi consequatur? quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut summo bono, dolorem ipsum, quia voluptas in liberos atque natum sit, aspernatur aut officiis debitis aut odit aut petat aut.",
                                style:
                                    TextStyle(color: CustomColors.lightpurple),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]))
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.79,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin:
                      EdgeInsets.only(top: 30, bottom: 10, left: 50, right: 50),
                  //       width: MediaQuery.of(context).size.width * 0.70,
                  height: 60,

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
                          return StoreCode(service: service);
                        },
                      ));
                      //  Get.off(() => CreditScoringForm());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Get Credit",
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )

          //  Column(
          //   children: [

          //   ],
          // ),
          ),
    );
  }
}
