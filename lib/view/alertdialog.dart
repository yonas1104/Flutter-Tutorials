import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ligmone/constants/Colors.dart';

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
          height: Get.height * 0.65,
          width: Get.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              SvgPicture.asset("assets/images/alert.svg"),
              SizedBox(
                height: 40,
              ),
              Text(title,
                  style: TextStyle(fontSize: 40, color: CustomColors.blue)),
              SizedBox(
                height: 30,
              ),
              Text(description,
                  style:
                      TextStyle(fontSize: 14, color: CustomColors.lightgray3)),
              Container(
                margin: EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                ),
                width: Get.width * 0.7,
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
