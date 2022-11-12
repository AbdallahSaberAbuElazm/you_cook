import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Center(
          child: SizedBox(
              height: 28,
              width: 28,
              child: CircularProgressIndicator(
                backgroundColor: redColor,
                color: greyColor,
              ))),
    );
  }
}
