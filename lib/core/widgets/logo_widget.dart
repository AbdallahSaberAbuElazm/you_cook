import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 9,
      child: Image.asset(
        'assets/images/logo.png',
        // fit: BoxFit.fill,
        // color: Colors.white,
      ),
    );
  }
}
