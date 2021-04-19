import 'package:flutter/material.dart';
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
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
              side: BorderSide(color: CustomColors.blue)),
          primary: !isSelected ? Colors.transparent : CustomColors.blue,
        ),
        onPressed: onPressed,
        child: Text(
          child,
          style: TextStyle(
            color: isSelected ? CustomColors.white : CustomColors.darkgray,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
