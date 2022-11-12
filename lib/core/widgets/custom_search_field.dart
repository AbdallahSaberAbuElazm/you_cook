import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  const CustomSearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 16.7,
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            fillColor: whiteColor,
            focusColor: blackColor,
            hoverColor: blackColor,
            hintText: 'بحث عن طعام،مطبخ...',
            hintStyle: const TextStyle(
              color: greyColor,
              fontSize: 12,
              fontFamily: 'NotoKufiArabic',
            ),
            iconColor: blackColor,
            prefixIcon: Image.asset(
              'assets/images/prefix_search.png',
              // fit: BoxFit.cover,
            ),
            suffixIcon: Image.asset(
              'assets/images/search_img.png',
              // fit: BoxFit.cover,
            )),
        cursorColor: blackColor,
        style: Theme.of(context).textTheme.bodyText2,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }
}
