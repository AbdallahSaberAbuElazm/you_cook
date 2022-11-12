import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/domain/entities/favourite.dart';
import 'package:you_cook/features/relish/domain/entities/kitchen.dart';
import 'package:you_cook/features/relish/presentation/pages/cart/add_to_cart.dart';
import 'package:you_cook/features/relish/presentation/pages/home/home.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/icon_with_background.dart';

class ListOfProducts extends StatelessWidget {
  final List list1;
  final List list2;
  final int itemCount;
  final dynamic compare1;
  final dynamic compare2;
  final Kitchen kitchen;
  const ListOfProducts(
      {super.key,
      required this.list1,
      required this.list2,
      required this.itemCount,
      required this.compare1,
      required this.compare2,
      required this.kitchen});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        mainAxisSpacing: 7,
        crossAxisSpacing: 20,
        crossAxisCount: 1,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Get.to(() => Home(
                    recentPage:
                        AddToCart(productIndex: index, kitchen: kitchen),
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
                            height: MediaQuery.of(context).size.height / 7.3,
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 55,
                              top: MediaQuery.of(context).size.width / 31,
                              bottom: MediaQuery.of(context).size.height / 90,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    ApiUrl.STORAGE_URL +
                                        (compare1 == compare2
                                            ? list1[index].productImage
                                            : list2[index].offerImage)),
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
                                right: MediaQuery.of(context).size.width / 44,
                              ),
                              child: Transform.translate(
                                offset: Offset(0,
                                    -MediaQuery.of(context).size.height / 110),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              Controllers.favouriteController
                                                  .addProductToFavouriteList(
                                                      favourite: Favourite(
                                                          // favouriteId: 0,
                                                          userId: HiveBoxes
                                                              .getUserId()!,
                                                          productId:
                                                              list1[index]
                                                                  .productId));
                                            },
                                            icon: const Icon(
                                                Icons.favorite_outlined,
                                                color: greyColor,
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      compare1 == compare2
                                                          ? list1[index]
                                                              .productNameAr
                                                          : list2[index]
                                                              .offerTitle,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: const TextStyle(
                                                          color: blackColor,
                                                          fontSize: 12,
                                                          height: 1.4,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                      compare1 == compare2
                                                          ? list1[index]
                                                              .productDescriptionAr
                                                          : list2[index]
                                                              .offerDescription,
                                                      style: const TextStyle(
                                                          color: greyColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 1.3,
                                                          fontSize: 9)),
                                                ]))),
                                    Transform.translate(
                                      offset: Offset(
                                          0,
                                          -MediaQuery.of(context).size.height /
                                              110),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${compare1 == compare2 ? list1[index].productPrice.toStringAsFixed(2) : list1[index].productPrice.toStringAsFixed(2)} ريالاً',
                                                style: const TextStyle(
                                                    color: redColor,
                                                    fontSize: 14.5,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              compare1 == 'العروض'
                                                  ? Text(
                                                      '${(list1[index].productPrice + ((list2[index].discount / 100) * list1[index].productPrice)).toStringAsFixed(2)} ريالاً',
                                                      style: const TextStyle(
                                                          color: greyColor,
                                                          fontSize: 9,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                    )
                                                  : const SizedBox.shrink()
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    33,
                                              ),
                                              child: const IconWithBackground(
                                                containerWidth: 30,
                                                containerHeight: 30,
                                                backgroundColor: lightGreyColor,
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
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1));
  }
}
