import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/icon_with_background.dart';

class ListOfOrders extends StatefulWidget {
  final List list1;
  final List list2;
  final int itemCount;
  final dynamic compare1;
  final dynamic compare2;
  // final Kitchen kitchen;
  const ListOfOrders({
    super.key,
    required this.list1,
    required this.list2,
    required this.itemCount,
    required this.compare1,
    required this.compare2,
  });

  @override
  State<ListOfOrders> createState() => _ListOfOrdersState();
}

class _ListOfOrdersState extends State<ListOfOrders> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 7,
        crossAxisSpacing: 20,
        crossAxisCount: 1,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return
              //  InkWell(
              //     onTap: () {
              //       Get.to(() => Home(
              //           recentPage:
              //               AddToCart(product: list1[index], kitchen: kitchen),
              //           selectedIndex: 0));
              //     },
              //     child:
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.19,
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
                              width: MediaQuery.of(context).size.width / 5.4,
                              height: MediaQuery.of(context).size.height / 9.7,
                              margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 60,
                                top: MediaQuery.of(context).size.width / 50,
                                // bottom: MediaQuery.of(context).size.height / 90,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(ApiUrl.STORAGE_URL +
                                      (widget.compare1 == widget.compare2
                                          ? widget
                                              .list1[index].product.productImage
                                          : widget.list2[index].offerImage)),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            widget.compare1 == widget.compare2
                                                ? widget.list1[index].product
                                                    .productNameAr
                                                : widget
                                                    .list2[index].offerTitle,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                color: blackColor,
                                                fontSize: 10,
                                                height: 0.8,
                                                fontWeight: FontWeight.w600)),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: greyColor,
                                                    size: 26))),
                                      ],
                                    ),
                                    Transform.translate(
                                      offset: Offset(
                                          0,
                                          -MediaQuery.of(context).size.height /
                                              120),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                            widget.compare1 == widget.compare2
                                                ? widget.list1[index].product
                                                    .productDescriptionAr
                                                : widget.list2[index]
                                                    .offerDescription,
                                            style: const TextStyle(
                                                color: greyColor,
                                                fontWeight: FontWeight.w500,
                                                height: 1.2,
                                                fontSize: 7)),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(
                                          0,
                                          -MediaQuery.of(context).size.height /
                                              120),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${widget.compare1 == widget.compare2 ? widget.list1[index].product.productPrice.toStringAsFixed(2) : widget.list1[index].product.productPrice.toStringAsFixed(2)} ????????????',
                                                style: const TextStyle(
                                                    color: redColor,
                                                    fontSize: 11.5,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    80),
                                            child: Container(
                                              padding: const EdgeInsets.all(7),
                                              decoration: const BoxDecoration(
                                                color: whiteColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    IconWithBackground(
                                                        backgroundColor:
                                                            lightGreyColor,
                                                        containerWidth: 26,
                                                        containerHeight: 26,
                                                        icon: Icons.add,
                                                        iconColor: redColor,
                                                        iconSize: 20,
                                                        onPressed: () {
                                                          Controllers
                                                              .selectedVariableController
                                                              .increaseProductQuantity();
                                                          setState(() {
                                                            Controllers
                                                                .orderController
                                                                .orderItems[
                                                                    index]
                                                                .quantity = Controllers
                                                                    .orderController
                                                                    .orderItems[
                                                                        index]
                                                                    .quantity! +
                                                                1;
                                                          });
                                                          Controllers
                                                              .orderController
                                                              .increasePriceOfOrder(
                                                                  price: widget
                                                                      .list1[
                                                                          index]
                                                                      .price);
                                                        }),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10),
                                                      child: Obx(() => Text(
                                                            Controllers
                                                                .orderController
                                                                .orderItems[
                                                                    index]
                                                                .quantity
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                              color: blackColor,
                                                              fontSize: 12,
                                                            ),
                                                          )),
                                                    ),
                                                    IconWithBackground(
                                                        backgroundColor:
                                                            lightGreyColor,
                                                        containerWidth: 26,
                                                        containerHeight: 26,
                                                        icon: Icons.remove,
                                                        iconColor: redColor,
                                                        iconSize: 20,
                                                        onPressed: () {
                                                          setState(() {
                                                            Controllers
                                                                .orderController
                                                                .orderItems[
                                                                    index]
                                                                .quantity = Controllers
                                                                    .orderController
                                                                    .orderItems[
                                                                        index]
                                                                    .quantity! -
                                                                1;
                                                          });
                                                          Controllers
                                                              .orderController
                                                              .decreasePriceOfOrder(
                                                                  price: widget
                                                                      .list1[
                                                                          index]
                                                                      .price);
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
              Expanded(
                child: IconWithBackground(
                    backgroundColor: Colors.green,
                    containerWidth: 30,
                    containerHeight: 31,
                    icon: Icons.check,
                    iconColor: whiteColor,
                    iconSize: 24,
                    onPressed: () {
                      Controllers.selectedVariableController
                          .decreaseProductQuantity();
                    }),
              ),
            ],
          );
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1));
  }
}
