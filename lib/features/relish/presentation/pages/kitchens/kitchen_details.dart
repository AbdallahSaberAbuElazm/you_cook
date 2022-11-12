import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/domain/entities/offer.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';
import 'package:you_cook/features/relish/presentation/widgets/get_all_products/get_list_of_products.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/buttons.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/rating_builder_with_number.dart';

class KitchenDetails extends StatefulWidget {
  final int index;
  const KitchenDetails({super.key, required this.index});

  @override
  State<KitchenDetails> createState() => _KitchenDetailsState();
}

class _KitchenDetailsState extends State<KitchenDetails> {
  List<Product>? products;
  List<Offer>? offers;
  @override
  void initState() {
    setState(() {
      products = Controllers.productController.products
          .where((product) =>
              product.kitchenId ==
              Controllers.kitchenController.kitchens[widget.index].kitchenId)
          .toList();

      offers = Controllers.offerController.offersForKitchen;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBars.buildKitchenAppbar(context: context),
        body: _buildBody(context: context),
      ),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return RefreshIndicator(
      color: redColor,
      onRefresh: () => _buildRefersh(context),
      child: Stack(children: [
        _drawBackgroundImage(context: context),
        _drawKitchenDetails(context: context),
      ]),
    );
  }

  //draw kitchen details
  Widget _drawKitchenDetails({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 4,
          left: MediaQuery.of(context).size.width / 17,
          right: MediaQuery.of(context).size.width / 17),
      child: ListView(padding: EdgeInsets.zero, children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4.5,
          child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width / 45,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          Controllers.kitchenController.kitchens[widget.index]
                              .kitchenNameAr,
                          style: Theme.of(context).textTheme.bodyText2),
                      Row(
                        children: [
                          smallIcon(icon: Icons.location_on),
                          descriptionTextKitchen(
                            text: Controllers.kitchenController
                                .kitchens[widget.index].kitchenAddress,
                          ),
                          smallIcon(icon: Icons.access_time),
                          descriptionTextKitchen(
                              text: Controllers.kitchenController
                                  .kitchens[widget.index].orderTime),
                        ],
                      ),
                      const RatingBuilderWithNumber(
                          ratingNumber: 4.9,
                          ratingItemSize: 20,
                          textDescriptionNumber: '(4.9)',
                          fontTextSize: 13),
                      SizedBox(
                        child: Text(
                          Controllers.kitchenController.kitchens[widget.index]
                              .kitchenDescription,
                          style: const TextStyle(color: greyColor, fontSize: 9),
                        ),
                      )
                    ]),
              )),
        ),
        // _drawButtons(context),
        Obx(() => Buttons.drawSelectedBtnFromTwoBtns(
            fBtnName: 'كل القائمة',
            sBtnName: 'العروض',
            fOnPressed: () {
              Controllers.selectedVariableController
                  .updateSelectedButtonForShowListKitchens(
                      selectedButton: 'كل القائمة');
            },
            sOnPressed: () {
              Controllers.selectedVariableController
                  .updateSelectedButtonForShowListKitchens(
                      selectedButton: 'العروض');
            },
            condition: Controllers.selectedVariableController
                .selectedButtonForShowLisKitchen.value,
            context: context)),
        Obx(() => ListOfProducts(
            kitchen: Controllers.kitchenController.kitchens[widget.index],
            list1: products!,
            list2: offers!,
            itemCount: Controllers.selectedVariableController
                        .selectedButtonForShowLisKitchen.value ==
                    'كل القائمة'
                ? products!.length
                : offers!.length,
            compare1: Controllers.selectedVariableController
                .selectedButtonForShowLisKitchen.value,
            compare2: 'كل القائمة')),
      ]),
    );
  }

  Widget descriptionTextKitchen({required String text}) {
    return SizedBox(
      child: Text(
        text,
        style: const TextStyle(
          color: greyColor,
          fontSize: 13,
          fontFamily: 'NotoKufiArabic',
        ),
      ),
    );
  }

  Widget smallIcon({required IconData icon}) {
    return Icon(
      icon,
      color: greyColor,
      size: 20,
    );
  }

  //backgound image
  Widget _drawBackgroundImage({required BuildContext context}) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.6,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          image: DecorationImage(
            image: CachedNetworkImageProvider(ApiUrl.STORAGE_URL +
                Controllers
                    .kitchenController.kitchens[widget.index].kitchenImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: 23,
              right: 23,
              top: MediaQuery.of(context).size.height / 4.5),
        ));
  }

  Future<void> _buildRefersh(BuildContext context) async {
    Controllers.productController.fetchAllProductsFromRemoteData();
    Controllers.offerController.fetchAllOffersFromRemoteData();
  }
}
