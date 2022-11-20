import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/loading_widget.dart';
import 'package:you_cook/features/relish/presentation/pages/home/home.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_screen.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/icon_with_background.dart';

class ListOfCarts extends StatefulWidget {
  const ListOfCarts({Key? key}) : super(key: key);

  @override
  State<ListOfCarts> createState() => _ListOfCartsState();
}

class _ListOfCartsState extends State<ListOfCarts> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.4,
        child:
            //  (Controllers.cartController.cartWithItems.isEmpty)
            (Controllers.cartController.cartItems.isEmpty)
                ? Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoadingWidget(),
                          Text(
                            'لا يوجد نتائج لحتي الأن',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ]),
                  )
                : StaggeredGridView.countBuilder(
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 20,
                    crossAxisCount: 1,
                    itemCount: Controllers.cartController.cartItems.length,
                    // .cartController.cartWithItems[0].cartItems.length,
                    itemBuilder: (context, index) {
                      final product = Controllers.productController.products
                          .where((product) =>
                                  product.productId ==
                                  Controllers.cartController.cartItems[index]
                                      .product.productId
                              // Controllers.cartController.cartWithItems[0]
                              //     .cartItems[index].product.productId
                              )
                          .single;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Card(
                                color: whiteColor,
                                elevation: 3,
                                shadowColor: lightGreyColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right:
                                        MediaQuery.of(context).size.width / 70,
                                    top: MediaQuery.of(context).size.height /
                                        120,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              9.7,
                                          margin: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                60,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                50,
                                            // bottom: MediaQuery.of(context).size.height / 90,
                                          ),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  ApiUrl.STORAGE_URL +
                                                      product.productImage),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  44,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(product.productNameAr,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                            color: blackColor,
                                                            fontSize: 10,
                                                            height: 0.8,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: IconButton(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            onPressed: () {
                                                              Controllers
                                                                  .cartController
                                                                  .removeProduct(
                                                                      product);

                                                              if (Controllers
                                                                      .cartController
                                                                      .cartItems
                                                                      .isEmpty
                                                                  // .cartWithItems[
                                                                  //     0]
                                                                  // .cartItems
                                                                  // .isEmpty
                                                                  ) {
                                                                Get.off(
                                                                    () => Home(
                                                                          recentPage:
                                                                              const RelishScreen(),
                                                                          selectedIndex:
                                                                              0,
                                                                        ));
                                                              }
                                                            },
                                                            icon: const Icon(
                                                                Icons
                                                                    .delete_outline_outlined,
                                                                color:
                                                                    greyColor,
                                                                size: 26))),
                                                  ],
                                                ),
                                                Transform.translate(
                                                  offset: Offset(
                                                      0,
                                                      -MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          120),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: Text(
                                                        product
                                                            .productDescriptionAr,
                                                        style: const TextStyle(
                                                            color: greyColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.2,
                                                            fontSize: 7)),
                                                  ),
                                                ),
                                                Transform.translate(
                                                  offset: Offset(
                                                      0,
                                                      -MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          120),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${product.productPrice.toStringAsFixed(2)} ريالاً',
                                                            style: const TextStyle(
                                                                color: redColor,
                                                                fontSize: 11.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                80),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(7),
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10),
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                IconWithBackground(
                                                                    backgroundColor:
                                                                        lightGreyColor,
                                                                    containerWidth:
                                                                        26,
                                                                    containerHeight:
                                                                        26,
                                                                    icon: Icons
                                                                        .add,
                                                                    iconColor:
                                                                        redColor,
                                                                    iconSize:
                                                                        20,
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        Controllers
                                                                            .cartController
                                                                            // .cartWithItems[
                                                                            //     0]
                                                                            .cartItems[index]
                                                                            .quantity = Controllers
                                                                                .cartController
                                                                                // .cartWithItems[0]
                                                                                .cartItems[index]
                                                                                .quantity! +
                                                                            1;
                                                                      });
                                                                    }),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                                  child: Text(
                                                                    Controllers
                                                                        .cartController
                                                                        // .cartWithItems[
                                                                        //     0]
                                                                        .cartItems[
                                                                            index]
                                                                        .quantity
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        const TextStyle(
                                                                      color:
                                                                          blackColor,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                IconWithBackground(
                                                                    backgroundColor:
                                                                        lightGreyColor,
                                                                    containerWidth:
                                                                        26,
                                                                    containerHeight:
                                                                        26,
                                                                    icon: Icons
                                                                        .remove,
                                                                    iconColor:
                                                                        redColor,
                                                                    iconSize:
                                                                        20,
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        Controllers
                                                                            .cartController
                                                                            // .cartWithItems[
                                                                            //     0]
                                                                            .cartItems[
                                                                                index]
                                                                            .quantity = Controllers
                                                                                .cartController.cartItems[index].quantity! -
                                                                            1;
                                                                      });
                                                                    }),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // ),
                                      ]),
                                )
                                // )
                                ),
                          ),
                        ],
                      );
                    },
                    staggeredTileBuilder: (index) =>
                        const StaggeredTile.fit(1)),
      ),
    );
  }
}
