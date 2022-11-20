import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/domain/entities/order.dart';
import 'package:you_cook/features/relish/presentation/pages/order/order_screen.dart';
import 'package:you_cook/features/relish/presentation/widgets/orders/current_order.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/buttons.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  List<Orders>? currentOrders;
  List<Orders>? previousOrders;

  @override
  void initState() {
    currentOrders = Controllers.orderController.currentOrders;
    previousOrders = Controllers.orderController.previousOrders;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBars.buildAppbarWithoutLeadingAndActions(
            context: context, title: 'طلباتي'),
        body: _buildBody(context: context),
      ),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 30,
                right: MediaQuery.of(context).size.width / 30),
            child: Column(children: [
              Obx(() => Buttons.drawSelectedBtnFromTwoBtns(
                  fBtnName: 'طلبات حالية',
                  sBtnName: 'طلبات سابقة',
                  fOnPressed: () {
                    Controllers.selectedVariableController
                        .updateSelectedButtonForShowListOrders(
                            selectedButton: 'طلبات حالية');
                  },
                  sOnPressed: () {
                    Controllers.selectedVariableController
                        .updateSelectedButtonForShowListOrders(
                            selectedButton: 'طلبات سابقة');
                  },
                  condition: Controllers.selectedVariableController
                      .selectedButtonForShowListOrders.value,
                  context: context)),
              // const Expanded(child: OrderScreen())
              Expanded(
                  child: Obx(() => (Controllers.selectedVariableController
                              .selectedButtonForShowListOrders.value ==
                          'طلبات حالية')
                      ? const OrderScreen()
                      //  const CurrentOrder()
                      : const SizedBox()))
            ])));
  }
}
