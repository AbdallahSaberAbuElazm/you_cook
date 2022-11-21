import 'package:flutter/material.dart';
import 'dart:async';

class Util {
  static Timer? timer;
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
