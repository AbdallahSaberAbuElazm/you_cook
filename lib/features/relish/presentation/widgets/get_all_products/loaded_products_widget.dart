import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';

class LoadedProductsWidget extends StatelessWidget {
  final List<Product> products;
  const LoadedProductsWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 30,
        right: MediaQuery.of(context).size.width / 30,
      ),
      mainAxisSpacing: 15,
      crossAxisSpacing: 9,
      crossAxisCount: 2,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              // Controllers.selectedVariableController.updateSelectedKitchen(
              //     kitchen: kitchens[index].kitchenNameAr);
            },
            child: Card(
                color: whiteColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
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
                                  ApiUrl.STORAGE_URL +
                                      products[index].productImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          Text(products[index].productNameAr,
                              style: Theme.of(context).textTheme.bodyText2),
                          Text(products[index].productDescriptionAr,
                              style: const TextStyle(
                                  color: greyColor, fontSize: 13)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    products[index]
                                        .productPrice
                                        .toStringAsFixed(2),
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
                              Container(
                                width: 27,
                                height: 27,
                                decoration: const BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
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
