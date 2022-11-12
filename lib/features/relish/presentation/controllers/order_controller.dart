import 'package:dartz/dartz.dart';
import 'package:get/state_manager.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/order.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/add_order_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/delete_order_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/get_all_order_usecase.dart';

class OrderController extends GetxController {
  final currentOrders = <Orders>[].obs;
  final previousOrders = <Orders>[].obs;
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
}
