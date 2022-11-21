import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/go_elevated_btn.dart';
import 'package:you_cook/features/relish/domain/entities/kitchen.dart';
import 'package:you_cook/features/relish/presentation/pages/cart/cart_screen.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_home.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/icon_with_background.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/rating_builder_with_number.dart';

class AddToCart extends StatelessWidget {
  final int productIndex;
  final Kitchen kitchen;

  const AddToCart({Key? key, required this.productIndex, required this.kitchen})
      : super(key: key);

  final _styleTxt = const TextStyle(
    color: greyColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: 'NotoKufiArabic',
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBars.buildCartScreenAppbar(
            title: Controllers
                .productController.products[productIndex].productNameAr,
            context: context,
            leading:
                AppBars.leadingDrawerInAppBar(context: context, iconSize: 22),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 22,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            ]),
        body: ListView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 45,
              bottom: MediaQuery.of(context).size.height / 45,
              right: MediaQuery.of(context).size.width / 22,
              left: MediaQuery.of(context).size.width / 22),
          children: [
            _drawProductImage(context: context),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 35,
                bottom: MediaQuery.of(context).size.height / 30,
              ),
              child: _drawProductInfo(context: context),
            ),
            Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 20,
                ),
                child: _drawPriceNoOfProducts(context: context)),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 6,
                right: MediaQuery.of(context).size.width / 6,
              ),
              child: GoElevatedBtn(
                  onPressed: () {
                    Controllers.cartController.addProduct(
                        context: context,
                        product: Controllers
                            .productController.products[productIndex],
                        price:
                            Controllers.productController.products[productIndex].productPrice *
                                Controllers.selectedVariableController
                                    .selectedProductQuantity.value,
                        quantity: Controllers.selectedVariableController
                            .selectedProductQuantity.value,
                        discount: (Controllers.offerController.offers.where((offer) => offer.productId == Controllers.productController.products[productIndex].productId).isNotEmpty)
                            ? Controllers.offerController.offers
                                    .where((offer) =>
                                        offer.productId ==
                                        Controllers.productController
                                            .products[productIndex].productId)
                                    .single
                                    .discount *
                                Controllers.selectedVariableController.selectedProductQuantity.value
                            : 0.0);

                    Controllers.cartController.updatePriceOfCart(
                        price: Controllers.productController
                                .products[productIndex].productPrice *
                            Controllers.selectedVariableController
                                .selectedProductQuantity.value);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RelishHome(
                                recentPage: const CartScreen(),
                                selectedIndex: 2)));
                  },
                  title: 'اضافة الي السلة',
                  btnColor: redColor,
                  textColor: whiteColor),
            )
          ],
        ),
      ),
    );
  }

  //draw product image
  Widget _drawProductImage({required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.4,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          image: DecorationImage(
              image: NetworkImage(
                ApiUrl.STORAGE_URL +
                    Controllers
                        .productController.products[productIndex].productImage,
              ),
              fit: BoxFit.cover)),
    );
  }

  //draw product info
  Widget _drawProductInfo({required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Controllers.productController.products[productIndex].productNameAr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(kitchen.kitchenNameAr, style: _styleTxt),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RatingBuilderWithNumber(
                ratingNumber: 4.9,
                ratingItemSize: 18.5,
                textDescriptionNumber: '(4.9)',
                fontTextSize: 10),
            IconWithBackground(
              containerWidth: 33,
              containerHeight: 33,
              backgroundColor: lightGreyColor,
              icon: Icons.favorite,
              iconSize: 24,
              iconColor: redColor,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          Controllers
              .productController.products[productIndex].productDescriptionAr,
          style: _styleTxt,
        ),
      ],
    );
  }

  _drawPriceNoOfProducts({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${Controllers.productController.products[productIndex].productPrice.toString()} ريالاً',
          style: const TextStyle(
            color: redColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            fontFamily: 'NotoKufiArabic',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(7),
          decoration: const BoxDecoration(
            color: lightGreyColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconWithBackground(
                    backgroundColor: whiteColor,
                    containerWidth: 31,
                    containerHeight: 31,
                    icon: Icons.add,
                    iconColor: redColor,
                    iconSize: 24,
                    onPressed: () {
                      Controllers.selectedVariableController
                          .increaseProductQuantity();
                      Controllers.productController.products[productIndex]
                              .productQuantity =
                          Controllers.selectedVariableController
                              .selectedProductQuantity.value;
                    }),
                const SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Obx(() => Text(
                        // Controllers
                        //             .productController
                        //             .products[widget.productIndex]
                        //             .productQuantity! >
                        //         0
                        //     ? Controllers.productController
                        //         .products[widget.productIndex].productQuantity
                        //         .toString()
                        //     : '1',
                        Controllers.selectedVariableController
                            .selectedProductQuantity.value
                            .toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      )),
                ),
                IconWithBackground(
                    backgroundColor: whiteColor,
                    containerWidth: 31,
                    containerHeight: 31,
                    icon: Icons.remove,
                    iconColor: redColor,
                    iconSize: 24,
                    onPressed: () {
                      Controllers.selectedVariableController
                          .decreaseProductQuantity();
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
