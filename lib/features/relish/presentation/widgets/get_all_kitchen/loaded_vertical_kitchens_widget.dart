import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/presentation/controllers/offer_controller.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_home.dart';
import 'package:you_cook/features/relish/presentation/pages/kitchens/kitchen_details.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/rating_builder_with_number.dart';

class LoadedVerticalKitchens extends StatelessWidget {
  const LoadedVerticalKitchens({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisSpacing: 9,
      crossAxisCount: 2,
      itemCount: Controllers.kitchenController.kitchens.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Get.to(() => RelishHome(
                  recentPage: KitchenDetails(index: index), selectedIndex: 0));

              Get.find<OfferController>();
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
                                      Controllers.kitchenController
                                          .kitchens[index].kitchenImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          Text(
                            Controllers.kitchenController.kitchens[index]
                                .kitchenNameAr,
                            style: const TextStyle(
                              fontSize: 10,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                          Row(
                            children: [
                              smallIcon(icon: Icons.location_on),
                              descriptionKitchen(
                                text: Controllers.kitchenController
                                    .kitchens[index].kitchenAddress,
                              ),
                              smallIcon(icon: Icons.access_time),
                              descriptionKitchen(
                                  text: Controllers.kitchenController
                                      .kitchens[index].orderTime),
                            ],
                          ),
                          const RatingBuilderWithNumber(
                              ratingNumber: 4.9,
                              ratingItemSize: 15,
                              textDescriptionNumber: '(4.9)',
                              fontTextSize: 8),
                        ],
                      ),
                    ))));
      },
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
    );
  }

  Widget descriptionKitchen({required String text}) {
    return SizedBox(
      child: Text(
        text,
        style: const TextStyle(
          color: greyColor,
          fontSize: 8,
          fontFamily: 'NotoKufiArabic',
        ),
      ),
    );
  }

  Widget smallIcon({required IconData icon}) {
    return Icon(
      icon,
      color: greyColor,
      size: 12,
    );
  }
}
