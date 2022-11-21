import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/util/util.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';
import 'package:you_cook/features/relish/domain/entities/cart_items.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/add_cart_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/delete_cart_items_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/get_specific_cart_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/get_user_cart_usecase.dart';

class CartController extends GetxController {
  final cartWithItems = <Cart>[].obs;
  final cartOrder = <Cart>[].obs;
  final cartItems = <CartItems>[].obs;
  final _products = {}.obs;
  final priceCart = 0.0.obs;
  var isLoading = true.obs;

  final AddCartUsecase addCartUsecase;
  final GetAllCartUsecase getAllCartUsecase;
  final DeleteCartItemUsecase deleteCartItemUsecase;
  final GetSpecificCartUsecase getSpecificCartUsecase;
  CartController(
      {required this.addCartUsecase,
      required this.getAllCartUsecase,
      required this.deleteCartItemUsecase,
      required this.getSpecificCartUsecase});

  @override
  void onInit() {
    fetchAllCartsFromRemoteData();
    super.onInit();
  }

  // Future<Either<String, List<Country>>>
  fetchAllCartsFromRemoteData() async {
    try {
      isLoading(true);
      cartWithItems.clear();
      cartItems.clear();
      var cartsData = await getAllCartUsecase();
      _mapFailureOrCarts(cartsData);
    } finally {
      isLoading(false);
    }
  }

  _mapFailureOrCarts(Either<Failure, Cart> either) {
    return either.fold((failure) {
      // failureTxt.value = mapFailureToMessage(failure);
    }, (cartsData) {
      updateCart(cart: cartsData);
    });
  }

  updateCart({required Cart cart}) {
    cartWithItems.clear();
    cartWithItems.add(cart);
    cartItems.clear();
    for (var cartItem in cart.cartItems) {
      cartItems.add(cartItem);
    }
    update();
  }

  updatePriceOfCart({required double price}) {
    priceCart.value += price;
    update();
  }

  // add product to cart items list
  void addProduct(
      {required Product product,
      required double price,
      required int quantity,
      required double discount,
      required BuildContext context}) {
    if (_products.containsKey(product)) {
      Util.snackBar(context: context, msg: 'هذا المنتج تمت اضافته الي السلة');
      // _products[product] += 1;
    } else {
      // _products[product] = 1;
      cartItems.add(CartItems(
          // cartItemId: product.productId,
          product: product,
          price: price,
          // discount: discount,
          // totalPrice: price - discount,
          quantity: quantity));

      //! add cart item to cart
      // addCartUsecase(
      //   cartItem: CartItems(
      //       price: price,
      //       // discount: discount,
      //       product: product,
      //       // totalPrice: price - discount,
      //       quantity: quantity),
      // ).then((value) {
      //   fetchAllCartsFromRemoteData();
      // });
    }
  }

  get products => _products;
  int productLength() {
    return _products.length;
  }

  // remove product from cart items list
  void removeProduct(Product product) {
    print('delete cart item : ');
    // _products.removeWhere((key, value) => key == product);
    final removeCartItem =
        // cartWithItems[0].
        cartItems.indexWhere(
            (cartItem) => cartItem.product.productId == product.productId);
    // print('remove cart item id :$removeCartItem');
    // cartWithItems[0].
    cartItems.removeAt(removeCartItem);
    // print(
    //     'cart item id : ${cartWithItems[0].cartItems.where((cartItem) => product.productId == product.productId).single.cartItemId!}');
    //! delete cart item from cart
    // deleteCartItemUsecase(
    //     cartItemId: cartWithItems[0]
    //         .cartItems
    //         .where((cartItem) => product.productId == product.productId)
    //         .single
    //         .cartItemId!);

    // fetchAllCartsFromRemoteData();
  }

  // get price of cart
  getAllPriceOffCart() {
    priceCart.value = 0.0;
    for (var cartItem in cartItems) {
      priceCart.value += cartItem.price;
      addCartUsecase(
        cartItem: CartItems(
            price: cartItem.price,
            // discount: discount,
            product: cartItem.product,
            // totalPrice: price - discount,
            quantity: cartItem.quantity),
      ).then((value) {
        fetchAllCartsFromRemoteData();
      });
    }
    update();
  }

  addCart({
    required List<CartItems> cartItemsForOrder,
  }) {
    for (var cartItem in cartItemsForOrder) {
      cartItem.status = 2;
      addCartUsecase(
        cartItem: CartItems(
            price: cartItem.price,
            // discount: discount,
            product: cartItem.product,
            // totalPrice: price - discount,
            quantity: cartItem.quantity),
      ).then((value) {
        fetchAllCartsFromRemoteData();
      });
    }
  }

  // change (decrease) price when delete item from cart
  decreasePriceWhenDeleteElement(
      {required double quantity, required double price}) {
    priceCart.value -= quantity * price;
    update();
  }

  // add cart to order
  addCartToOrder() {
    // var price = 0.0;
    // for (var item in cartItems) {
    //   price += item.price;
    // }
    getAllPriceOffCart();
    cartOrder.clear();
    Controllers.orderController.updateOrderItems(orderCartItems: cartItems);
    cartItems.clear();

    cartOrder.add(Cart(
        cartId: cartWithItems[0].cartId,
        price: priceCart.value,
        discount: 0.0,
        totalPrice: priceCart.value,
        cartItems: cartWithItems[0].cartItems));

    update();
  }

  //update quantity of cart item in cart
  updateCartItem() {}
}
