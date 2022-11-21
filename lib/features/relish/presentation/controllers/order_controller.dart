import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/util/util.dart';
import 'package:you_cook/features/relish/domain/entities/cart_items.dart';
import 'package:you_cook/features/relish/domain/entities/order.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/add_order_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/delete_order_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/get_all_order_usecase.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_home.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_screen.dart';

class OrderController extends GetxController {
  final currentOrders = <Orders>[].obs;
  final previousOrders = <Orders>[].obs;
  final orderItems = <CartItems>[].obs;
  final orderPrice = 0.0.obs;
  var isLoading = true.obs;

  final GetAllOrderUsecase getAllOrderUsecase;
  final DeleteOrderUsecase deleteOrderUsecase;
  final AddOrderUsecase addOrderUsecase;
  OrderController(
      {required this.getAllOrderUsecase,
      required this.deleteOrderUsecase,
      required this.addOrderUsecase});

  @override
  void onInit() {
    fetchAllOrdersFromRemoteData();
    getPriceOfOrder();
    super.onInit();
  }

  // Future<Either<String, List<Country>>>
  fetchAllOrdersFromRemoteData() async {
    try {
      isLoading(true);
      var ordersData = await getAllOrderUsecase();
      _mapFailureOrOrders(ordersData);
    } finally {
      isLoading(false);
    }
  }

  _mapFailureOrOrders(Either<Failure, List<Orders>> either) {
    return either.fold((failure) {
      // failureTxt.value = mapFailureToMessage(failure);
    }, (ordersData) {
      currentOrders.value = ordersData;
    });
  }

  addOrder({required Orders order, required BuildContext context}) {
    addOrderUsecase(order: order).then((value) {
      Util.snackBar(context: context, msg: 'تم ارسال الطلب');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => RelishHome(
                  recentPage: const RelishScreen(),
                  selectedIndex: 0))).then((value) {
        Controllers.cartController.cartItems.clear();
        Controllers.cartController.cartOrder.clear();
        Controllers.cartController.cartWithItems.clear();
      });
    });
  }

  //get price of product
  getPriceOfOrder() {
    orderPrice.value = 0.0;
    for (var orderItem in orderItems) {
      orderPrice.value += orderItem.price;
    }
  }

  //increase price of product
  increasePriceOfOrder({required double price}) {
    orderPrice.value += price;
    update();
  }

  // decrease price of product
  decreasePriceOfOrder({required double price}) {
    orderPrice.value -= price;
    update();
  }

  // update list of items in order
  updateOrderItems({required List<CartItems> orderCartItems}) {
    orderItems.clear();
    for (var orderItem in orderCartItems) {
      orderItems.add(orderItem);
    }
  }
}
