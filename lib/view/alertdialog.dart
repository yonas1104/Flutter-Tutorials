import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/SizeConfig.dart';
import 'package:ligmone/constants/Colors.dart';

//this is Custom alert dialog that will appear on first use of the application
class CustomAlertDialog extends StatelessWidget {
  String title;
  String description;
  String imagepath;
  String buttontext;
  Function onPressed;
  CustomAlertDialog(
      {@required this.buttontext,
      @required this.description,
      @required this.imagepath,
      @required this.onPressed,
      @required this.title});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(120),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(120),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: Colors.white,
          ),
          height: SizeConfig.blockSizeVertical * 65,
          width: SizeConfig.blockSizeHorizontal * 85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              SvgPicture.asset("assets/images/alert.svg"),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Text(title,
                  style: TextStyle(fontSize: 40, color: CustomColors.blue)),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 5,
              ),
              Text(description,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      color: CustomColors.lightgray3)),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 5,
              ),
              Container(
                alignment: Alignment.center,
                width: SizeConfig.blockSizeVertical * 70,
                height: 60,
                child: RaisedButton(
                  disabledColor: CustomColors.lightgray3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: CustomColors.blue,
                  onPressed: onPressed,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      buttontext,
                      style: TextStyle(color: CustomColors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
