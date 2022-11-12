import 'package:flutter/material.dart';

class Util {
  static snackBar({required BuildContext context, required String? msg}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg!,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      backgroundColor: Colors.white,
    ));
  }
}
