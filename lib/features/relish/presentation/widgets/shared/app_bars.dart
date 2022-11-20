import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/widgets/custom_search_field.dart';
import 'package:you_cook/core/widgets/logo_widget.dart';
import 'package:you_cook/features/relish/presentation/pages/cart/cart_screen.dart';
import 'package:you_cook/features/relish/presentation/pages/home/home.dart';

class AppBars {
  // app bar for relish screen
  static AppBar buildRelishAppbar(
      {required BuildContext context,
      required TextEditingController controller}) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height / 5.7,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      title: const LogoWidget(),
      centerTitle: true,
      elevation: 0,
      backgroundColor: redColor,
      bottom: PreferredSize(
        preferredSize: const Size(40, 40),
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 30,
              right: MediaQuery.of(context).size.width / 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('توصيل الوجبات الساخنة والسريعة',
                  style: Theme.of(context).textTheme.headline5),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 60,
                  bottom: MediaQuery.of(context).size.height / 50,
                ),
                child: CustomSearchField(controller: controller),
              )
            ],
          ),
        ),
      ),
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.density_medium_outlined,
            color: Colors.white,
            size: 29, // Changing Drawer Icon Size
          ),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      }),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => Home(
                          recentPage: const CartScreen(), selectedIndex: 2)));
            },
            icon: const SizedBox(
                width: 32,
                height: 32,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: whiteColor,
                  size: 29,
                )))
      ],
    );
  }

  // app bar for kitchen screen
  static AppBar buildKitchenAppbar({
    required BuildContext context,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leading: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 50,
        ),
        child: leadingDrawerInAppBar(context: context, iconSize: 26),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 17,
            // right: MediaQuery.of(context).size.width / 30,
            top: MediaQuery.of(context).size.height / 50,
          ),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: whiteColor,
                size: 18,
              )),
        )
      ],
    );
  }

  //draw drawer
  static Widget leadingDrawerInAppBar(
      {required BuildContext context, required double iconSize}) {
    return Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width / 17,
        ),
        child: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.density_medium_outlined,
              color: Colors.white,
              size: iconSize, // Changing Drawer Icon Size
            ),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }));
  }

  //app bar for cart screen
  static AppBar buildCartScreenAppbar(
      {required BuildContext context,
      required String title,
      required Widget leading,
      required List<Widget> actions}) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height / 12.2,
      elevation: 0,
      centerTitle: true,
      backgroundColor: redColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
            color: whiteColor, fontSize: 14, fontWeight: FontWeight.w600),
      ),
      actions: actions,
    );
  }

  //draw appbar without leading and actions
  static AppBar buildAppbarWithoutLeadingAndActions({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height / 12.2,
      elevation: 0,
      centerTitle: true,
      backgroundColor: redColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leading: const SizedBox.shrink(),
      title: Text(
        title,
        style: const TextStyle(
            color: whiteColor, fontSize: 14, fontWeight: FontWeight.w600),
      ),
      actions: const [SizedBox.shrink()],
    );
  }
}
