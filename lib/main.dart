import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/view/App/notcomputed.dart';
import 'package:ligmone/view/FirstTime/creditscoringform.dart';
import 'package:ligmone/view/app/home.dart';
import 'package:ligmone/view/app/loancritriacalculator.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/alertdialog.dart';
import 'view/app/transaction.dart';
import 'view/welcome/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // getSharedPreferenceInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      home: MaterialApp(
        title: 'Flutter Demo',
        home: Welcome(),
      ),
    );
  }
}
