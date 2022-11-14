import 'package:dartz/dartz.dart';
import 'package:get/state_manager.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';
import 'package:you_cook/features/relish/domain/entities/cart_items.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/add_cart_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/delete_cart_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/get_all_cart_usecase.dart';

class CartController extends GetxController {
  final carts = <Cart>[].obs;
  final cartOrder = <Cart>[].obs;
  final cartItems = <CartItems>[].obs;
  final _products = {}.obs;
  final priceCart = 0.0.obs;
  var isLoading = true.obs;

  final AddCartUsecase addCartUsecase;
  final GetAllCartUsecase getAllCartUsecase;
  final DeleteCartUsecase deleteCartUsecase;
  CartController(
      {required this.addCartUsecase,
      required this.getAllCartUsecase,
      required this.deleteCartUsecase});

  @override
  void onInit() {
    fetchAllCategoriesFromRemoteData();
    super.onInit();
  }

  // Future<Either<String, List<Country>>>
  fetchAllCategoriesFromRemoteData() async {
    try {
      isLoading(true);
      var cartsData = await getAllCartUsecase();
      _mapFailureOrCarts(cartsData);
    } finally {
      isLoading(false);
    }
  }

  _mapFailureOrCarts(Either<Failure, List<Cart>> either) {
    return either.fold((failure) {
      // failureTxt.value = mapFailureToMessage(failure);
    }, (cartsData) {
      carts.value = cartsData;
    });
  }

  updatePriceOfCart({required double price}) {
    priceCart.value += price;
    update();
  }

  void addProduct(
      {required Product product, required double price, required quantity}) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
      cartItems.add(CartItems(
          cartItemId: product.productId,
          product: product,
          price: price,
          quantity: quantity));
      addCartUsecase(
          cart: Cart(
              price: price,
              discount: 0.0,
              totalPrice: product.priceIncludeTax,
              cartItems: cartItems));
    }
  }

  get products => _products;
  int productLength() {
    return _products.length;
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
      final removeCartItem = cartItems
          .indexWhere((cartItem) => cartItem.cartItemId == product.productId);
      cartItems.removeAt(removeCartItem);
    } else {
      _products[product] -= 1;
    }
  }

  getAllPriceOffCart() {
    priceCart.value = 0.0;
    for (var cartData in carts) {
      priceCart.value += cartData.totalPrice;
    }
    update();
  }

  decreasePriceWhenDeleteElement({required double quantity}) {
    priceCart.value -= quantity;
    update();
  }

  addCartToOrder() {
    var price = 0.0;
    for (var item in cartItems) {
      price += item.price;
    }
    cartOrder.clear();
    cartOrder.add(Cart(
        price: price, discount: 0.0, totalPrice: price, cartItems: cartItems));
    update();
  }
}
