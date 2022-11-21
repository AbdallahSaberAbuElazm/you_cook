import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/features/cook/cook_add_product.dart';
import 'package:you_cook/features/cook/cook_all_products.dart';
import 'package:you_cook/features/cook/cook_home_page.dart';
import 'package:you_cook/features/relish/presentation/pages/home/user_orders.dart';

class CookHome extends StatefulWidget {
  Widget recentPage;
  int selectedIndex;
  CookHome({super.key, required this.recentPage, required this.selectedIndex});

  @override
  State<CookHome> createState() => _CookHomeState();
}

class _CookHomeState extends State<CookHome> {
  List<Widget> pages = [
    const CookHomePage(),
    const CookAddProduct(),
    const CookAllProducts(),

    // const CookProductDetail(),
  ];
  void updateTabSelection(int index) {
    setState(() {
      widget.selectedIndex = index;
      widget.recentPage = pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: widget.recentPage,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            //color of the BottomAppBar
            color: Colors.white,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 20,
                    right: MediaQuery.of(context).size.width / 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _drawIcon(
                        icon: widget.selectedIndex == 0
                            ? Icons.home_rounded
                            : Icons.home_rounded,
                        index: 0,
                        name: 'الصفحة الرئيسية'),
                    _drawIcon(
                        icon: widget.selectedIndex == 1
                            ? Icons.food_bank_rounded
                            : Icons.food_bank_rounded,
                        index: 1,
                        name: 'إضافة منتج'),
                    _drawIcon(
                        icon: widget.selectedIndex == 2
                            ? Icons.food_bank_rounded
                            : Icons.food_bank_rounded,
                        index: 2,
                        name: 'كل المنتجات'),
                    // _drawIcon(
                    //     icon: widget.selectedIndex == 3
                    //         ? Icons.percent_sharp
                    //         : Icons.percent_sharp,
                    //     index: 3,
                    //     name: 'العروض'),
                    // _drawIcon(
                    //     icon: widget.selectedIndex == 4
                    //         ? Icons.favorite
                    //         : Icons.favorite_outline,
                    //     index: 4,
                    //     name: 'المفضلة'),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  //icon for bottom navigation bar
  Widget _drawIcon(
      {required IconData icon, required int index, required String name}) {
    return SizedBox(
      width: 76,
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            autofocus: true,
            //update the bottom app bar view each time an item is clicked
            onPressed: () {
              updateTabSelection(index);
            },
            iconSize: 32.0,
            icon: Icon(
              icon,
              //darken the icon if it is selected or else give it a different color
              color: widget.selectedIndex == index ? redColor : greyColor,
            ),
            focusColor: Colors.white,
            // splashColor: redColor,
            hoverColor: Colors.white,
          ),
          Transform.translate(
            offset: const Offset(0, -6),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 8,
                color: widget.selectedIndex == index ? redColor : greyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
