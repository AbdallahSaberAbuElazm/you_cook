import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/domain/entities/kitchen.dart';
import 'package:you_cook/features/relish/presentation/pages/cart/add_to_cart.dart';
import 'package:you_cook/features/relish/presentation/pages/home/home.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/icon_with_background.dart';

class ListOfFavourites extends StatelessWidget {
  const ListOfFavourites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => RefreshIndicator(
        color: redColor,
        onRefresh: () => _buildRefersh(context),
        child: StaggeredGridView.countBuilder(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            mainAxisSpacing: 7,
            crossAxisSpacing: 20,
            crossAxisCount: 1,
            itemCount: Controllers.favouriteController.favourites.length,
            itemBuilder: (context, index) {
              final product = Controllers.productController.products
                  .where((product) =>
                      product.productId ==
                      Controllers
                          .favouriteController.favourites[index].productId)
                  .single;

              return InkWell(
                  onTap: () {
                    Get.to(() => Home(
                        recentPage: AddToCart(
                            productIndex: index,
                            kitchen: Controllers.kitchenController.kitchens
                                .where((kitchen) =>
                                    kitchen.kitchenId == product.kitchenId)
                                .single),
                        selectedIndex: 0));
                  },
                  child: Card(
                      color: whiteColor,
                      elevation: 3,
                      shadowColor: lightGreyColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 70,
                          top: MediaQuery.of(context).size.height / 120,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 4.2,
                                height:
                                    MediaQuery.of(context).size.height / 7.3,
                                margin: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width / 55,
                                  top: MediaQuery.of(context).size.width / 31,
                                  bottom:
                                      MediaQuery.of(context).size.height / 90,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        ApiUrl.STORAGE_URL +
                                            product.productImage),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right:
                                        MediaQuery.of(context).size.width / 44,
                                  ),
                                  child: Transform.translate(
                                    offset: Offset(
                                        0,
                                        -MediaQuery.of(context).size.height /
                                            110),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  Controllers
                                                      .favouriteController
                                                      .removeProductFromFavouriteList(
                                                          product: product);
                                                },
                                                icon: const Icon(
                                                    Icons.favorite_outlined,
                                                    color: redColor,
                                                    size: 22))),
                                        Transform.translate(
                                            offset: Offset(
                                                0,
                                                -MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    110),
                                            child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.9,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          product.productNameAr,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: const TextStyle(
                                                              color: blackColor,
                                                              fontSize: 12,
                                                              height: 1.4,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                          product
                                                              .productDescriptionAr,
                                                          style:
                                                              const TextStyle(
                                                                  color:
                                                                      greyColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height: 1.3,
                                                                  fontSize: 9)),
                                                    ]))),
                                        Transform.translate(
                                          offset: Offset(
                                              0,
                                              -MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  110),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${product.productPrice.toStringAsFixed(2)} ريالاً',
                                                style: const TextStyle(
                                                    color: redColor,
                                                    fontSize: 14.5,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        33,
                                                  ),
                                                  child:
                                                      const IconWithBackground(
                                                    containerWidth: 30,
                                                    containerHeight: 30,
                                                    backgroundColor:
                                                        lightGreyColor,
                                                    icon: Icons.shopping_cart,
                                                    iconSize: 22,
                                                    iconColor: Colors.green,
                                                    onPressed: null,
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      )));
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1))));
  }

  Future<void> _buildRefersh(BuildContext context) async {
    Controllers.favouriteController.fetchAllFavouritesFromRemoteData();
  }
}
