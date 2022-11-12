import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';

class ChoosePayment extends StatelessWidget {
  final String titleName;
  final Widget prefixTitleWidget;
  final double iconSize;
  final dynamic onPressed;
  const ChoosePayment(
      {super.key,
      required this.titleName,
      required this.prefixTitleWidget,
      required this.iconSize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 15,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 25,
        right: MediaQuery.of(context).size.width / 25,
      ),
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(60)),
          boxShadow: [
            BoxShadow(
              color: lightGreyColor,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              prefixTitleWidget,
              const SizedBox(
                width: 5,
              ),
              Text(
                titleName,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.radio_button_off_outlined,
                color: redColor,
                size: 23,
              ))
        ],
      ),
    );
  }
}
