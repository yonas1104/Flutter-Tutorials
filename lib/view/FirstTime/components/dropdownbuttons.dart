import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ligmone/constants/Colors.dart';

//Custom drop down buttons with some styling

class DropDownButtons extends StatelessWidget {
  //these are properties of the custom dropdownbutton
  List<String> dropdownvalue;
  double width;
  double marginLeft;
  String hint;
  Function onChanged;
  String selected;
  String title;
  bool margintop;
  DropDownButtons(
      {this.dropdownvalue,
      this.width,
      this.hint,
      this.marginLeft,
      this.onChanged,
      this.selected,
      this.title,
      this.margintop});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title != null
            ? Container(
                margin: EdgeInsets.only(left: 15, bottom: 10, top: 30),
                alignment: Alignment.bottomLeft,
                child: Text(
                  title != null ? title : "",
                  style: TextStyle(color: CustomColors.lightgray3),
                ))
            : Container(
                height: 0,
                width: 0,
              ),
        Container(
          width: width,
          height: 60,
          margin: EdgeInsets.only(bottom: margintop == null ? 30 : 10),
          padding: EdgeInsets.only(
              left: marginLeft == null ? 33 : marginLeft, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CustomColors.lightgray,
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            focusColor: CustomColors.blue,
            value: selected,
            hint: Text(hint),
            icon: SvgPicture.asset(
              "assets/images/dropdownicon.svg",
              height: 8,
            ),
            elevation: 16,
            style: TextStyle(color: CustomColors.blue),
            underline: Container(
              color: Colors.transparent,
            ),
            onChanged: onChanged,
            items: [...dropdownvalue]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  margin: EdgeInsets.only(
                    right: marginLeft == null ? 30 : marginLeft,
                  ),
                  child: Text(
                    value,
                    style: TextStyle(color: CustomColors.darkgray),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
