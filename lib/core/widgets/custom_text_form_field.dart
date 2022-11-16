import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isEnabled;
  final TextInputType keyboadType;
  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.controller,
      required this.isEnabled,
      required this.keyboadType});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 90),
        child: Container(
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(36))),
          child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(width: 0.6, color: greyColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(36),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: lightGreyColor,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        )
                      ]),
                  child: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 50,
                          top: 8),
                      child: TextFormField(
                        enabled: isEnabled,
                        controller: controller,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            border: InputBorder.none,
                            fillColor: whiteColor,
                            focusColor: blackColor,
                            hoverColor: blackColor,
                            iconColor: blackColor,
                            errorStyle: TextStyle(
                              color: redColor,
                              fontSize: 9,
                              height: 0.6,
                              fontFamily: 'NotoKufiArabic',
                            )),
                        cursorColor: blackColor,
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: 11,
                          fontFamily: 'NotoKufiArabic',
                        ),
                        keyboardType: keyboadType,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك أدخل $title';
                          }
                          return null;
                        },
                        // maxLines: null,
                      ))),
              Transform.translate(
                offset: const Offset(-20, 4),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
