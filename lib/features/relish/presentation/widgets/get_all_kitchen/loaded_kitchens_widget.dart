import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/rating_builder.dart';
import 'package:you_cook/features/relish/domain/entities/kitchen.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_home.dart';
import 'package:you_cook/features/relish/presentation/pages/kitchens/kitchen_details.dart';

class LoadedKitchensWidget extends StatelessWidget {
  final List<Kitchen> kitchens;
  const LoadedKitchensWidget({super.key, required this.kitchens});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 4.1,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: kitchens.length,
          itemBuilder: (context, index) {
            return Row(children: [
              InkWell(
                onTap: () {
                  Controllers.offerController.getOffersForKitchens(
                      kitchenId: kitchens[index].kitchenId);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RelishHome(
                              recentPage: KitchenDetails(index: index),
                              selectedIndex: 0)));
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width / 45,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.95,
                            height: MediaQuery.of(context).size.height / 8,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      ApiUrl.STORAGE_URL +
                                          kitchens[index].kitchenImage,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            kitchens[index].kitchenNameAr,
                            style: const TextStyle(
                              fontSize: 11,
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                          Row(
                            children: [
                              smallIcon(icon: Icons.location_on),
                              descriptionKitchen(
                                text: kitchens[index].kitchenAddress,
                              ),
                              smallIcon(icon: Icons.access_time),
                              descriptionKitchen(
                                  text: kitchens[index].orderTime),
                            ],
                          ),
                          Row(
                            children: [
                              const RatingBuilder(rating: 4.9, itemSize: 15),
                              descriptionKitchen(text: '(4.9)'),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 1,
                color: whiteColor,
              )
            ]);
          },
        ));
  }

  Widget descriptionKitchen({required String text}) {
    return SizedBox(
      child: Text(
        text,
        style: const TextStyle(
          color: greyColor,
          fontSize: 10,
          fontFamily: 'NotoKufiArabic',
        ),
      ),
    );
  }

  Widget smallIcon({required IconData icon}) {
    return Icon(
      icon,
      color: greyColor,
      size: 15,
    );
  }
}
