import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 4, right: 15),
          child: ListTile(
            title: Text(
              'تبديل المستخدم',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Get.back();
            },
          ),
        )
      ]),
    );
  }
}
