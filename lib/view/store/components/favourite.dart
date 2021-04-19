import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ligmone/constants/Colors.dart';
import 'dart:math' as math;
import '../storedetail.dart';

class Favourite extends StatelessWidget {
  List<Map<String, dynamic>> services = [
    {
      "id": 1,
      "name": "champs sport",
      "image": "assets/images/champs.jpg",
      "url": "",
    },
    {
      "id": 2,
      "name": "Foot Locker",
      "image": "assets/images/footlocker.jpeg",
      "url": "",
    },
    {
      "id": 3,
      "name": "H&M",
      "image": "assets/images/H&M.jpeg",
      "url": "",
    },
    {
      "id": 4,
      "name": "Journeys",
      "image": "assets/images/journeys.jpg",
      "url": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 20, top: 20),
            child: Text("Favourite",
                style: TextStyle(
                    color: Color(0xFF2334D0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.93,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30),
                itemCount: services.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return StoreDetail(
                            service: services[index],
                          );
                        },
                      ));
                    },
                    child: Container(
                      height: 400,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                              // margin: EdgeInsets.only(top: 10),
                              height: 160,
                              width: 200,
                              child: Image.asset(
                                services[index]['image'],
                                fit: BoxFit.cover,
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 35,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(services[index]['name']),
                                  Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: SvgPicture.asset(
                                      "assets/images/leftarrow.svg",
                                      height: 20,
                                    ),
                                  )
                                ]),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(color: Colors.grey, blurRadius: 1)
                        // ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
