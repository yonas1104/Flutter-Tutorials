import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:ligmone/view/app/components/transaction2.dart';

import 'components/elgibilty.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 12, vsync: this);
    super.initState();
  }

  LineChartData sampleData1() {
    return LineChartData(
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: 0,
        lineTouchData: LineTouchData(
          touchTooltipData:
              LineTouchTooltipData(tooltipBgColor: CustomColors.darkgray),
          touchCallback: (LineTouchResponse touchResponse) {},
          handleBuiltInTouches: true,
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: false,
          ),
          leftTitles: SideTitles(
            showTitles: false,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: Colors.transparent,
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 2.5),
              FlSpot(2, 3.5),
              FlSpot(3, 1),
              FlSpot(4, 3),
              FlSpot(5, 3),
              FlSpot(6, 3.5),
              FlSpot(7, 2),
              FlSpot(8, 3.5),
              FlSpot(9, 1.5),
              FlSpot(10, 3.5),
              FlSpot(11, 3),
              FlSpot(12, 1.4),
              FlSpot(13, 3),
            ],
            isCurved: true,
            colors: [
              CustomColors.lightgray3,
            ],
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
            ),
            belowBarData: BarAreaData(
              show: false,
            ),
          ),
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 2.8),
              FlSpot(7, 1.2),
              FlSpot(10, 2.8),
              FlSpot(12, 1.6),
              FlSpot(14, 2),
              FlSpot(20, 5),
            ],
            isCurved: true,
            colors: [
              CustomColors.white,
            ],
            barWidth: 4,
            //   isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
            ),
            belowBarData: BarAreaData(show: false, colors: [
              CustomColors.white,
            ]),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 370,
          padding: EdgeInsets.only(left: 20),
          width: Get.width,
          color: CustomColors.blue,
          child: LineChart(
            sampleData1(),
            swapAnimationDuration: Duration(milliseconds: 250),
          ),
        ),
        Positioned(
          top: 330,
          child: Container(
            // alignment: Alignment.center,
            height: 150,
            width: 400,
            child: ListView.builder(
                itemCount: 2,
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Eligibility();
                }),
          ),
        ),
        Positioned(top: 480, child: Transaction2()),
        Positioned(
          top: 0,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  "9738",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rockwellr"),
                ),
                Text(
                  "Excellent",
                  style:
                      TextStyle(fontSize: 22, color: CustomColors.lightgray3),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 330,
          child: Container(
            // alignment: Alignment.center,
            height: 150,
            width: 400,
            child: ListView.builder(
                itemCount: 2,
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Eligibility();
                }),
          ),
        ),
        Container(
          child: TabBar(
              indicatorColor: Colors.black,
              isScrollable: true,
              controller: _tabController,
              tabs: [
                Tab(
                  //  text: "ff",
                  child: Text(
                    "Jan",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  //  text: "fcsf",
                  child: Text(
                    "Feb",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Mar",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Apr",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "May",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Jun",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Jul",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Aug",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Sept",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Oct",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Nov",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: "fssf",
                  child: Text(
                    "Dec",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
