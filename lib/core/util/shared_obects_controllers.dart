import 'package:get/get.dart';
import 'package:you_cook/core/util/shared_controller/selected_variable_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/cart_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/category_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/favourite_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/kitchen_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/offer_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/order_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/product_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/user_controller.dart';

class Controllers {
  static SelectedVariableController selectedVariableController =
      Get.find<SelectedVariableController>();
  static UserController userController = Get.find();
  static CategoryController categoryController = Get.find();
  static KitchenController kitchenController = Get.find();
  static ProductController productController = Get.find();
  static OfferController offerController = Get.find<OfferController>();
  static CartController cartController = Get.find();
  static OrderController orderController = Get.find();
  static FavouriteController favouriteController = Get.find();
}
