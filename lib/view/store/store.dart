import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/store/components/Deals.dart';
import 'package:ligmone/view/store/components/favourite.dart';
import 'package:ligmone/view/store/components/stores.dart';

class Store extends StatelessWidget {
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          // title: SvgPicture.asset(
          //   "assets/images/leftarrow.svg",
          //   fit: BoxFit.cover,
          //   height: 30,
          // ),
          actions: [
            SvgPicture.asset(
              "assets/images/search.svg",
              height: 30,
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                CustomColors.white,
                CustomColors.servicesbackground
              ])),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              SliverList(
                  delegate:
                      SliverChildListDelegate([Deals(), Stores(), Favourite()]))
            ],
          ),
        ));
  }
}
