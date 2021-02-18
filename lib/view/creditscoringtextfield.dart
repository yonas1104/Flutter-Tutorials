import 'package:flutter/material.dart';

import 'package:ligmone/constants/Colors.dart';

class CreditScoringTextField extends StatelessWidget {
  String hint;
  String title;
  String subtitle;
  Widget icon;
  double marginleft;
  bool margintop;
  Function onTap;
  double width;
  String initialValue;
  double margintopvalue;
  CreditScoringTextField(
      {this.hint,
      this.initialValue,
      this.title,
      this.subtitle,
      this.margintopvalue,
      this.width,
      this.icon,
      this.onTap,
      this.margintop,
      this.marginleft});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          title != null
              ? Container(
                  margin: EdgeInsets.only(
                      left: marginleft == null ? 40 : marginleft,
                      bottom: 10,
                      top: 25),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Status",
                    style: TextStyle(color: CustomColors.lightgray3),
                  ))
              : Container(
                  margin: EdgeInsets.only(bottom: 10),
                ),
          subtitle != null
              ? Container(
                  margin: EdgeInsets.only(
                      left: marginleft == null ? 40 : marginleft,
                      bottom: 10,
                      top: 1),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    subtitle,
                    style: TextStyle(color: CustomColors.lightgray3),
                  ))
              : Container(
                  margin: EdgeInsets.only(
                      top: margintopvalue == null ? 0 : margintopvalue),
                ),
          Container(
            width: width == null ? 350 : width,
            //  margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: CustomColors.lightgray,
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              onTap: onTap,

              initialValue: initialValue == null ? "" : initialValue,
              // controller: _nameController,
              // key: _nameFormKey,
              onChanged: (value) {
                // setState(() {
                //   validated = isFormValid();
                //   _nameFormKey.currentState.validate();
                // });
              },
              validator: (value) {
                if (value.length < 1) {
                  return "Please input your name";
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: icon != null
                    ? Container(
                        child: icon,
                      )
                    : null,
                hintText: hint != null ? "   " + hint : " ",
                hintStyle: TextStyle(color: CustomColors.creditamount),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.lightgray),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.lightgray),
                    borderRadius: BorderRadius.circular(20)),

                //   enabled: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
