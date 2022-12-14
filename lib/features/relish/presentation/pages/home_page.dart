import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/core/widgets/merge_images.dart';
import 'package:you_cook/features/cook/cook_home.dart';
import 'package:you_cook/features/cook/cook_home_page.dart';
import 'package:you_cook/features/relish/presentation/controllers/cart_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/category_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/kitchen_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/product_controller.dart';
import 'package:you_cook/features/relish/presentation/pages/auth/login_relish.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_home.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: InkWell(
                  onTap: () {
                    if (HiveBoxes.getUserToken() == null) {
                      Get.to(() => const LoginRelish());
                    } else {
                      Get.to(() => RelishHome(
                          recentPage: const RelishScreen(), selectedIndex: 0));
                    }

                    Get.find<CategoryController>();
                    Get.find<KitchenController>();
                    Get.find<ProductController>();
                    if (HiveBoxes.getUserToken()!.isNotEmpty) {
                      Get.find<CartController>();
                    }
                  },
                  child: const MergeImges(
                      backgroundImage:
                          'assets/images/relish_background_logo_1.png',
                      imageUrl: 'assets/images/relish_background_logo_2.png',
                      optionText: '????????????????',
                      descriptionText: '?????? ???????????? ?????????? ?????????????? ??????????????'))),
          const Divider(
            color: whiteColor,
            height: 6,
          ),
          Expanded(
              child: InkWell(
                  onTap: () {
                    Get.to(() => CookHome(
                        recentPage: const CookHomePage(), selectedIndex: 0));
                  },
                  child: const MergeImges(
                      backgroundImage:
                          'assets/images/cook_background_logo_1.png',
                      imageUrl: 'assets/images/cook_background_logo_2.png',
                      optionText: '????????????????',
                      descriptionText: '?????????? ???????? ?????????? ???????????? ??????????'))),
          const Divider(
            color: whiteColor,
            height: 6,
          ),
          Expanded(
              child: InkWell(
                  onTap: () {},
                  child: const MergeImges(
                      backgroundImage:
                          'assets/images/deliver_background_logo_1.png',
                      imageUrl: 'assets/images/deliver_background_logo_2.png',
                      optionText: '????????',
                      descriptionText: '?????? ???????? ?????????????? ???????????? ??????????????'))),
        ],
      ),
    );
  }
}
