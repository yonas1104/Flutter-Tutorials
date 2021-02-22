import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligmone/SizeConfig.dart';
import 'package:ligmone/constants/Colors.dart';

//radio buttons of getting started
class Buttons extends StatelessWidget {
  String child; //button text
  Function onPressed; //onpressed fuction call back

  bool isSelected = false;
  Buttons({
    this.child,
    this.onPressed,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: Get.width * 0.1,
      height: SizeConfig.blockSizeVertical * 5.5,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        onPressed: onPressed,
        color: !isSelected ? CustomColors.lightgray : CustomColors.blue,
        child: Text(
          child,
          style: TextStyle(
            color: !isSelected ? CustomColors.blue : CustomColors.white,
            fontSize: SizeConfig.blockSizeHorizontal * 3,
          ),
        ),
      ),
    );
  }
}
