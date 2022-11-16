import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:you_cook/core/util/shared_controller/selected_variable_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/cart_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/category_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/favourite_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/kitchen_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/offer_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/order_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/product_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/user_controller.dart';
import 'package:you_cook/core/config/init_hive_boxes_configuration.dart';
import 'package:you_cook/core/styles/app_theme.dart';
import 'package:you_cook/core/config/config_loading_toast.dart';
import 'package:you_cook/features/splash/presentation/splash_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  //get app directory
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await InitHiveBoxesConfiguration.initHiveBoxes();
  getControllers();
  ConfigLoadingToast.configLoading();
  runApp(const YouCook());
}

getControllers() {
  Get.lazyPut<SelectedVariableController>(() => SelectedVariableController(),
      fenix: true);
  Get.lazyPut<UserController>(
      () => UserController(
            loginUserServiceUsecase: di.sl(),
            logoutUserServiceUsecase: di.sl(),
            registerUserServiceUsecase: di.sl(),
          ),
      fenix: true);

  Get.lazyPut<CategoryController>(
      () => CategoryController(
            categoryUsecase: di.sl(),
          ),
      fenix: true);
  Get.put<KitchenController>(
    KitchenController(getAllKitchensUsecase: di.sl()),
  );
  Get.lazyPut<ProductController>(
      () => ProductController(getAllProductsUsecase: di.sl()),
      fenix: true);
  Get.lazyPut<OfferController>(
      () => OfferController(getAllOfferUsecase: di.sl()),
      fenix: true);
  Get.lazyPut<CartController>(
      () => CartController(
          addCartUsecase: di.sl(),
          getAllCartUsecase: di.sl(),
          deleteCartItemUsecase: di.sl(),
          getSpecificCartUsecase: di.sl()),
      fenix: true);
  Get.lazyPut<OrderController>(
      () => OrderController(
            addOrderUsecase: di.sl(),
            deleteOrderUsecase: di.sl(),
            getAllOrderUsecase: di.sl(),
          ),
      fenix: true);
  Get.lazyPut<FavouriteController>(
      () => FavouriteController(
            favouriteUsecase: di.sl(),
            addFavouriteUsecase: di.sl(),
            deleteFavouriteUsecase: di.sl(),
          ),
      fenix: true);
}

class YouCook extends StatelessWidget {
  const YouCook({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetMaterialApp(
          theme: theme(),
          debugShowCheckedModeBanner: false,
          title: 'YouCook',
          home: const SplashScreen()),
    );
  }
}
