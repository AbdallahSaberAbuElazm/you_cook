import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 9,
      child: SvgPicture.asset(
        'assets/images/logo.svg',
        // fit: BoxFit.fill,
        // color: Colors.white,
      ),
    );
  }
}
