import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/go_elevated_btn.dart';
import 'package:you_cook/features/relish/domain/entities/order.dart';
import 'package:you_cook/features/relish/presentation/widgets/carts/choose_payment_card.dart';
import 'package:you_cook/features/relish/presentation/widgets/orders/current_order.dart';
import 'package:you_cook/features/relish/presentation/widgets/orders/get_list_of_orders.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Orders>? currentOrders;
  List<Orders>? previousOrders;

  @override
  void initState() {
    currentOrders = Controllers.orderController.currentOrders;
    previousOrders = Controllers.orderController.previousOrders;
    Controllers.orderController.getPriceOfOrder();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(children: [
          Obx(() => ListOfOrders(
              list1: Controllers.orderController.orderItems,
              // Controllers.cartController.cartOrder[0].cartItems,
              list2: previousOrders!,
              compare1: Controllers.selectedVariableController
                  .selectedButtonForShowListOrders.value,
              compare2: 'طلبات حالية',
              itemCount:
                  //  Controllers.selectedVariableController
                  //             .selectedButtonForShowListOrders.value ==
                  //         'طلبات حالية'
                  //     ?
                  Controllers.cartController.cartOrder[0].cartItems.length
              // : previousOrders!.length,
              )),
          (Controllers.orderController.orderItems.isNotEmpty)
              ? _infoOfCurrentOrder()
              : const SizedBox(),
        ]));
  }

  Widget _infoOfCurrentOrder() {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const CurrentOrder(),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 90),
            child: _drawResetInfo(context: context),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 70,
                bottom: MediaQuery.of(context).size.height / 50,
                left: MediaQuery.of(context).size.width / 26,
                right: MediaQuery.of(context).size.width / 26,
              ),
              child: Column(
                children: [
                  ChoosePayment(
                    iconSize: 23,
                    onPressed: () {},
                    titleName: 'الدفع عند الإستلام',
                    prefixTitleWidget: const SizedBox.shrink(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  ChoosePayment(
                    iconSize: 23,
                    onPressed: () {},
                    titleName: '1234 **** **** ****',
                    prefixTitleWidget: const Icon(
                      Icons.payment_outlined,
                      color: blackColor,
                      size: 25,
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Obx(() => _priceRowDetail(
              title: 'الإجمالي',
              price: Controllers.orderController.orderPrice.value
              //  Controllers.cartController.cartOrder[0].price
              )),
          _priceRowDetail(title: 'تكلفة التوصيل', price: 0.0),
          Obx(() => _drawTotalPrice(
              title: 'المجموع',
              price: Controllers.orderController.orderPrice.value)),
          Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 50,
                bottom: MediaQuery.of(context).size.height / 30,
                left: MediaQuery.of(context).size.width / 6,
                right: MediaQuery.of(context).size.width / 6,
              ),
              child: GoElevatedBtn(
                  onPressed: () {
                    Controllers.orderController.addOrder(
                        context: context,
                        order: Orders(
                            userId: HiveBoxes.getUserId()!,
                            addressId: 0,
                            cartId: Controllers
                                .cartController.cartWithItems[0].cartId,
                            status: 'pending',
                            type: '',
                            price:
                                Controllers.cartController.cartOrder[0].price,
                            discount: Controllers
                                .cartController.cartOrder[0].discount,
                            deliveryPrice: 0.0,
                            totalPrice:
                                Controllers.cartController.cartOrder[0].price,
                            deposit: 0.0,
                            isDeposit: false,
                            deliveryMethod: '',
                            paymentMethod: ''));
                  },
                  title: 'اطلب الآن',
                  btnColor: redColor,
                  textColor: whiteColor))
        ]);
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

  Widget _drawBoldText({required String title}) {
    return Text(
      title,
      style: const TextStyle(
          color: blackColor, fontSize: 13, fontWeight: FontWeight.bold),
    );
  }
}
