import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/domain/entities/offer.dart';

class LoadedOffersWidget extends StatelessWidget {
  final List<Offer> offers;

  const LoadedOffersWidget({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      mainAxisSpacing: 15,
      crossAxisSpacing: 9,
      crossAxisCount: 2,
      itemCount: offers.length,
      itemBuilder: (context, index) {
        final product = Controllers.productController.products
            .where((product) => product.productId == offers[index].productId)
            .single;
        final kitchen = Controllers.kitchenController.kitchens
            .where((kitchen) => kitchen.kitchenId == offers[index].kitchenId)
            .single;
        return InkWell(
            onTap: () {
              // Controllers.selectedVariableController.updateSelectedKitchen(
              //     kitchen: kitchens[index].kitchenNameAr);
            },
            child: Card(
                color: whiteColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width / 45,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.8,
                    // height: MediaQuery.of(context).size.height / 8,

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  ApiUrl.STORAGE_URL + offers[index].offerImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          Text(offers[index].offerTitle,
                              style: Theme.of(context).textTheme.bodyText2),
                          Text(kitchen.kitchenNameAr,
                              style: const TextStyle(
                                  color: greyColor, fontSize: 10)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 120,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 4, bottom: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(22)),
                            child: Text(
                              '%${offers[index].discount} فقط',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 120,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    product.productPrice.toStringAsFixed(2),
                                    style: const TextStyle(
                                        color: redColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text(
                                    'ريالاً',
                                    style: TextStyle(
                                      color: redColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${(product.productPrice + ((offers[index].discount / 100) * product.productPrice)).toStringAsFixed(2)} ريالاً',
                                style: const TextStyle(
                                    color: greyColor,
                                    fontSize: 9,
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                        ]),
                  ),
                )));
      },
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
    );
  }
}
