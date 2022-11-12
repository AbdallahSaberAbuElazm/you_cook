import 'package:get/get.dart';

class SelectedVariableController extends GetxController {
  RxInt selectedCategoryId = 0.obs;
  RxString selectedCategoryName = ''.obs;
  RxInt selectedKitchen = 0.obs;
  RxDouble newRating = 0.0.obs;
  RxInt selectedProductQuantity = 1.obs;
  var selectedButtonForShowLisKitchen = 'كل القائمة'.obs;
  var selectedButtonForShowListOrders = 'طلبات حالية'.obs;

  //update selected category
  updateSelectedCategory(
      {required int categoryId, required String categoryName}) {
    selectedCategoryId.value = categoryId;
    selectedCategoryName.value = categoryName;
    update();
  }

  // update selected kitchen
  updateSelectedKitchen({required int kitchenId}) {
    selectedKitchen.value = kitchenId;
    update();
  }

  //update rating
  updateNewRating(double rating) {
    newRating.value = rating;
    update();
  }

  //update selected button for show list for kitchens
  updateSelectedButtonForShowListKitchens({required String selectedButton}) {
    selectedButtonForShowLisKitchen.value = selectedButton;
    update();
  }

  //update selected button for show list for orders
  updateSelectedButtonForShowListOrders({required String selectedButton}) {
    selectedButtonForShowListOrders.value = selectedButton;
    update();
  }

  //increase product's quantity
  increaseProductQuantity() {
    selectedProductQuantity.value++;
  }

  //decrease product's quantity
  decreaseProductQuantity() {
    if (selectedProductQuantity > 1) {
      selectedProductQuantity.value--;
    }
  }

  //update product's quantity
  updateProductQuantity({required int productQty}) {
    selectedProductQuantity.value = productQty;
  }
}
