import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/go_elevated_btn.dart';
import 'package:you_cook/features/relish/presentation/pages/home/home.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_screen.dart';
import 'package:you_cook/features/relish/presentation/pages/home/user_orders.dart';
import 'package:you_cook/features/relish/presentation/widgets/carts/list_of_carts.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await Get.off(
              () => Home(recentPage: const RelishScreen(), selectedIndex: 2));
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBars.buildAppbarWithoutLeadingAndActions(
                context: context, title: 'السلة'),
            body: _buildBody(context: context),
          ),
        ));
  }

  Widget _buildBody({required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 60,
              left: MediaQuery.of(context).size.width / 30,
              right: MediaQuery.of(context).size.width / 30),
          child: ListView(
            children: [
              const ListOfCarts(),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 100,
                  bottom: MediaQuery.of(context).size.height / 80,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GoElevatedBtn(
                      onPressed: () {
                        Controllers.cartController.addCartToOrder();
                        Get.to(() => Home(
                            recentPage: const UserOrders(), selectedIndex: 2));
                      },
                      title: 'التالي',
                      btnColor: redColor,
                      textColor: whiteColor),
                ),
              ),
            ],
          )),
    );
  }
}
