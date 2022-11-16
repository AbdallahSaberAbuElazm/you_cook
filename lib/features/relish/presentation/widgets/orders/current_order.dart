import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/go_elevated_btn.dart';
import 'package:you_cook/features/relish/presentation/widgets/carts/choose_payment_card.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/icon_with_background.dart';

class CurrentOrder extends StatefulWidget {
  const CurrentOrder({super.key});

  @override
  State<CurrentOrder> createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    //  Obx(() => (Controllers.cartController.cartItems.isNotEmpty)
    // ? ListView(
    // shrinkWrap: true,
    // physics: const NeverScrollableScrollPhysics(),
    //     children: [
    //         StaggeredGridView.countBuilder(
    //             padding: EdgeInsets.zero,
    //             shrinkWrap: true,
    //             physics: const NeverScrollableScrollPhysics(),
    //             mainAxisSpacing: 7,
    //             crossAxisSpacing: 20,
    //             crossAxisCount: 1,
    //             itemCount: Controllers.cartController.cartItems.length,
    //             itemBuilder: (context, index) {
    //               return Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   SizedBox(
    //                     width: MediaQuery.of(context).size.width / 1.19,
    //                     child: Card(
    //                         color: whiteColor,
    //                         elevation: 3,
    //                         shadowColor: lightGreyColor,
    //                         shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(8)),
    //                         child: Padding(
    //                           padding: EdgeInsets.only(
    //                             right:
    //                                 MediaQuery.of(context).size.width / 70,
    //                             top: MediaQuery.of(context).size.height /
    //                                 120,
    //                           ),
    //                           child: Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.start,
    //                               crossAxisAlignment:
    //                                   CrossAxisAlignment.start,
    //                               children: [
    //                                 Container(
    //                                   width: MediaQuery.of(context)
    //                                           .size
    //                                           .width /
    //                                       5.4,
    //                                   height: MediaQuery.of(context)
    //                                           .size
    //                                           .height /
    //                                       9.7,
    //                                   margin: EdgeInsets.only(
    //                                     right: MediaQuery.of(context)
    //                                             .size
    //                                             .width /
    //                                         60,
    //                                     top: MediaQuery.of(context)
    //                                             .size
    //                                             .width /
    //                                         50,
    //                                     // bottom: MediaQuery.of(context).size.height / 90,
    //                                   ),
    //                                   decoration: BoxDecoration(
    //                                     image: DecorationImage(
    //                                       image: CachedNetworkImageProvider(
    //                                           ApiUrl.STORAGE_URL +
    //                                               Controllers
    //                                                   .cartController
    //                                                   .cartItems[index]
    //                                                   .product
    //                                                   .productImage),
    //                                       fit: BoxFit.cover,
    //                                     ),
    //                                     borderRadius:
    //                                         const BorderRadius.all(
    //                                       Radius.circular(8),
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 Expanded(
    //                                   child: Padding(
    //                                     padding: EdgeInsets.only(
    //                                       right: MediaQuery.of(context)
    //                                               .size
    //                                               .width /
    //                                           44,
    //                                     ),
    //                                     child: Column(
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.start,
    //                                       mainAxisSize: MainAxisSize.min,
    //                                       children: [
    //                                         Row(
    //                                           mainAxisAlignment:
    //                                               MainAxisAlignment
    //                                                   .spaceBetween,
    //                                           children: [
    //                                             Text(
    //                                                 Controllers
    //                                                     .cartController
    //                                                     .cartItems[index]
    //                                                     .product
    //                                                     .productNameAr,
    //                                                 textAlign:
    //                                                     TextAlign.start,
    //                                                 style: const TextStyle(
    //                                                     color: blackColor,
    //                                                     fontSize: 10,
    //                                                     height: 0.8,
    //                                                     fontWeight:
    //                                                         FontWeight
    //                                                             .w600)),
    //                                             Align(
    //                                                 alignment:
    //                                                     Alignment.topLeft,
    //                                                 child: IconButton(
    //                                                     padding:
    //                                                         EdgeInsets.zero,
    //                                                     onPressed: () {
    //                                                       Controllers
    //                                                           .cartController
    //                                                           .removeProduct(Controllers
    //                                                               .cartController
    //                                                               .cartItems[
    //                                                                   index]
    //                                                               .product);
    //                                                     },
    //                                                     icon: const Icon(
    //                                                         Icons
    //                                                             .delete_outline_outlined,
    //                                                         color:
    //                                                             greyColor,
    //                                                         size: 26))),
    //                                           ],
    //                                         ),
    //                                         Transform.translate(
    //                                           offset: Offset(
    //                                               0,
    //                                               -MediaQuery.of(context)
    //                                                       .size
    //                                                       .height /
    //                                                   120),
    //                                           child: SizedBox(
    //                                             width:
    //                                                 MediaQuery.of(context)
    //                                                         .size
    //                                                         .width /
    //                                                     2,
    //                                             child: Text(
    //                                                 Controllers
    //                                                     .cartController
    //                                                     .cartItems[index]
    //                                                     .product
    //                                                     .productDescriptionAr,
    //                                                 style: const TextStyle(
    //                                                     color: greyColor,
    //                                                     fontWeight:
    //                                                         FontWeight.w500,
    //                                                     height: 1.2,
    //                                                     fontSize: 7)),
    //                                           ),
    //                                         ),
    //                                         Transform.translate(
    //                                           offset: Offset(
    //                                               0,
    //                                               -MediaQuery.of(context)
    //                                                       .size
    //                                                       .height /
    //                                                   120),
    //                                           child: Row(
    //                                             mainAxisAlignment:
    //                                                 MainAxisAlignment
    //                                                     .spaceBetween,
    //                                             // crossAxisAlignment: CrossAxisAlignment.start,
    //                                             children: [
    //                                               Row(
    //                                                 children: [
    //                                                   Text(
    //                                                     '${Controllers.cartController.cartItems[index].product.productPrice.toStringAsFixed(2)} ريالاً',
    //                                                     style: const TextStyle(
    //                                                         color: redColor,
    //                                                         fontSize: 11.5,
    //                                                         fontWeight:
    //                                                             FontWeight
    //                                                                 .bold),
    //                                                   ),
    //                                                   const SizedBox(
    //                                                     width: 3,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                               Padding(
    //                                                 padding: EdgeInsets.only(
    //                                                     left: MediaQuery.of(
    //                                                                 context)
    //                                                             .size
    //                                                             .width /
    //                                                         80),
    //                                                 child: Container(
    //                                                   padding:
    //                                                       const EdgeInsets
    //                                                           .all(7),
    //                                                   decoration:
    //                                                       const BoxDecoration(
    //                                                     color: whiteColor,
    //                                                     borderRadius:
    //                                                         BorderRadius
    //                                                             .all(
    //                                                       Radius.circular(
    //                                                           10),
    //                                                     ),
    //                                                   ),
    //                                                   child: Center(
    //                                                     child: Row(
    //                                                       mainAxisAlignment:
    //                                                           MainAxisAlignment
    //                                                               .spaceBetween,
    //                                                       crossAxisAlignment:
    //                                                           CrossAxisAlignment
    //                                                               .center,
    //                                                       children: [
    //                                                         IconWithBackground(
    //                                                             backgroundColor:
    //                                                                 lightGreyColor,
    //                                                             containerWidth:
    //                                                                 26,
    //                                                             containerHeight:
    //                                                                 26,
    //                                                             icon: Icons
    //                                                                 .add,
    //                                                             iconColor:
    //                                                                 redColor,
    //                                                             iconSize:
    //                                                                 20,
    //                                                             onPressed:
    //                                                                 () {
    //                                                               Controllers
    //                                                                   .selectedVariableController
    //                                                                   .increaseProductQuantity();
    //                                                               Controllers
    //                                                                   .productController
    //                                                                   .products[
    //                                                                       index]
    //                                                                   .productQuantity = Controllers.selectedVariableController.selectedProductQuantity.value;
    //                                                             }),
    //                                                         Padding(
    //                                                           padding: const EdgeInsets
    //                                                                   .only(
    //                                                               left: 10,
    //                                                               right:
    //                                                                   10),
    //                                                           child: Obx(
    //                                                               () =>
    //                                                                   Text(
    //                                                                     // Controllers
    //                                                                     //             .productController
    //                                                                     //             .products[widget.productIndex]
    //                                                                     //             .productQuantity! >
    //                                                                     //         0
    //                                                                     //     ? Controllers.productController
    //                                                                     //         .products[widget.productIndex].productQuantity
    //                                                                     //         .toString()
    //                                                                     //     : '1',
    //                                                                     Controllers.selectedVariableController.selectedProductQuantity.value.toString(),
    //                                                                     textAlign:
    //                                                                         TextAlign.center,
    //                                                                     style:
    //                                                                         const TextStyle(
    //                                                                       color: blackColor,
    //                                                                       fontSize: 12,
    //                                                                     ),
    //                                                                   )),
    //                                                         ),
    //                                                         IconWithBackground(
    //                                                             backgroundColor:
    //                                                                 lightGreyColor,
    //                                                             containerWidth:
    //                                                                 26,
    //                                                             containerHeight:
    //                                                                 26,
    //                                                             icon: Icons
    //                                                                 .remove,
    //                                                             iconColor:
    //                                                                 redColor,
    //                                                             iconSize:
    //                                                                 20,
    //                                                             onPressed:
    //                                                                 () {
    //                                                               Controllers
    //                                                                   .selectedVariableController
    //                                                                   .decreaseProductQuantity();
    //                                                             }),
    //                                                       ],
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 // ),
    //                               ]),
    //                         )
    //                         // )
    //                         ),
    //                   ),
    //                   Expanded(
    //                     child: IconWithBackground(
    //                         backgroundColor: Colors.green,
    //                         containerWidth: 30,
    //                         containerHeight: 31,
    //                         icon: Icons.check,
    //                         iconColor: whiteColor,
    //                         iconSize: 24,
    //                         onPressed: () {
    //                           Controllers.selectedVariableController
    //                               .decreaseProductQuantity();
    //                         }),
    //                   ),
    //                 ],
    //               );
    //             },
    //             staggeredTileBuilder: (index) =>
    //                 const StaggeredTile.fit(1)),
    //         Padding(
    //           padding: EdgeInsets.only(
    //               top: MediaQuery.of(context).size.height / 90),
    //           child: _drawResetInfo(context: context),
    //         ),
    //         Padding(
    //             padding: EdgeInsets.only(
    //               top: MediaQuery.of(context).size.height / 70,
    //               bottom: MediaQuery.of(context).size.height / 50,
    //               left: MediaQuery.of(context).size.width / 26,
    //               right: MediaQuery.of(context).size.width / 26,
    //             ),
    //             child: Column(
    //               children: [
    //                 ChoosePayment(
    //                   iconSize: 23,
    //                   onPressed: () {},
    //                   titleName: 'الدفع عند الإستلام',
    //                   prefixTitleWidget: const SizedBox.shrink(),
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height / 50,
    //                 ),
    //                 ChoosePayment(
    //                   iconSize: 23,
    //                   onPressed: () {},
    //                   titleName: '1234 **** **** ****',
    //                   prefixTitleWidget: const Icon(
    //                     Icons.payment_outlined,
    //                     color: blackColor,
    //                     size: 25,
    //                   ),
    //                 ),
    //               ],
    //             )),
    //         SizedBox(
    //           height: MediaQuery.of(context).size.height / 50,
    //         ),
    //         _priceRowDetail(title: 'الإجمالي', price: 96.00),
    //         _priceRowDetail(title: 'تكلفة التوصيل', price: 05.00),
    //         _drawTotalPrice(title: 'المجموع', price: 101.00),
    //         Padding(
    //             padding: EdgeInsets.only(
    //               top: MediaQuery.of(context).size.height / 50,
    //               bottom: MediaQuery.of(context).size.height / 30,
    //               left: MediaQuery.of(context).size.width / 6,
    //               right: MediaQuery.of(context).size.width / 6,
    //             ),
    //             child: GoElevatedBtn(
    //                 onPressed: () {},
    //                 title: 'اطلب الآن',
    //                 btnColor: redColor,
    //                 textColor: whiteColor))
    //       ])
    // : const SizedBox.shrink());
  }

  Widget _addTextDetail({required String title}) {
    return Text(
      title,
      style: const TextStyle(
          color: redColor,
          fontSize: 12,
          fontFamily: 'NotoKufiArabic',
          fontWeight: FontWeight.w600),
    );
  }

  Widget _priceRowDetail({required String title, required double price}) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 140,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _drawBoldText(title: title),
          _addTextDetail(title: '$price ريالا'),
        ],
      ),
    );
  }

  Widget _drawTotalPrice({required String title, required double price}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 15,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 25,
        right: MediaQuery.of(context).size.width / 25,
      ),
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 200,
        right: MediaQuery.of(context).size.width / 200,
        top: MediaQuery.of(context).size.height / 70,
        bottom: MediaQuery.of(context).size.height / 80,
      ),
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: lightGreyColor,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _drawBoldText(title: title),
          _addTextDetail(title: '$price ريالا'),
        ],
      ),
    );
  }

  Widget _drawRow(
      {required String btnTitle,
      required String title,
      required Widget buttonTitle,
      required dynamic onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        TextButton(onPressed: () {}, child: buttonTitle),
      ],
    );
  }

  Widget _drawResetInfo({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'عنوان التسليم',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        _drawRow(
            title: '${HiveBoxes.getUserArea()}  ${HiveBoxes.getUserAddress()}',
            btnTitle: 'تغيير',
            buttonTitle: _addTextDetail(title: 'تغيير'),
            onPressed: () {}),
        _drawRow(
            title: 'طريقة الدفع أو السداد',
            btnTitle: 'إضافة بطاقة',
            buttonTitle: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: redColor,
                  size: 17,
                ),
                _addTextDetail(title: 'إضافة بطاقة'),
              ],
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget _drawBoldText({required String title}) {
    return Text(
      title,
      style: const TextStyle(
          color: blackColor, fontSize: 13, fontWeight: FontWeight.bold),
    );
  }
}
