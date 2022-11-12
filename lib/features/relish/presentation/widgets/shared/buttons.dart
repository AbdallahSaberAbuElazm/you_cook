import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';

class Buttons {
  // draw button
  static Widget buttonForNextStep(
      {required BuildContext context,
      required Color btnColor,
      required String btnName,
      required Color textColor,
      required dynamic onPressed}) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 3.4,
      // height: 40,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: btnColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 70,
                bottom: MediaQuery.of(context).size.height / 70,
                left: MediaQuery.of(context).size.width / 40,
                right: MediaQuery.of(context).size.width / 40),
            child: Text(
              btnName,
              style: TextStyle(
                  color: textColor, fontSize: 12, fontFamily: 'NotoKufiArabic'),
            ),
          )),
    );
  }

  // draw two buttons for selection
  static Widget drawSelectedBtnFromTwoBtns(
      {required String fBtnName,
      required String sBtnName,
      required Function fOnPressed,
      required Function sOnPressed,
      required dynamic condition,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 27,
        bottom: MediaQuery.of(context).size.height / 27,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonForNextStep(
              btnName: fBtnName,
              onPressed: fOnPressed,
              btnColor: condition == fBtnName ? redColor : lightGreyColor,
              textColor: condition == fBtnName ? whiteColor : blackColor,
              context: context),
          const SizedBox(
            width: 15,
          ),
          buttonForNextStep(
              btnName: sBtnName,
              onPressed: sOnPressed,
              btnColor: condition == sBtnName ? redColor : lightGreyColor,
              textColor: condition == sBtnName ? whiteColor : blackColor,
              context: context),
        ],
      ),
    );
  }
}
