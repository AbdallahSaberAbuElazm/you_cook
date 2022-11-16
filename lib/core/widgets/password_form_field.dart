import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String title;
  const PasswordFormField(
      {Key? key, required this.controller, required this.title})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 90),
        child: Container(
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(36))),
          child: Stack(children: [
            Container(
                decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(width: 0.6, color: greyColor),
                    borderRadius: const BorderRadius.all(Radius.circular(36)),
                    boxShadow: const [
                      BoxShadow(
                        color: lightGreyColor,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      )
                    ]),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextFormField(
                    cursorColor: blackColor,
                    controller: widget.controller,
                    validator: (val) => (val != null && val.length < 8)
                        ? 'كلمة المرور اقل من 8 احرف'
                        : null,
                    textDirection: TextDirection.ltr,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 20, right: 20, top: 17, bottom: 8),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: whiteColor,
                      focusColor: blackColor,
                      hoverColor: blackColor,
                      errorStyle: const TextStyle(
                        color: redColor,
                        fontSize: 9,
                        height: 0.6,
                        fontFamily: 'NotoKufiArabic',
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          (_passwordVisible == true)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: redColor,
                          size: 21,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_passwordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.right,
                  ),
                )),
            Transform.translate(
              offset: const Offset(-20, 4),
              child: Text(
                widget.title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ]),
        ));
  }
}
