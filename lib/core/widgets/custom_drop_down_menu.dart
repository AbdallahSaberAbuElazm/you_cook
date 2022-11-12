import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';

class CustomDropdownMenu extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const CustomDropdownMenu(
      {super.key, required this.title, required this.controller});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String genderValue = 'ذكر';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          color: Colors.white,
          elevation: 9,
          shadowColor: Colors.grey.withOpacity(0.4),
          margin: const EdgeInsets.only(bottom: 9, top: 8),
          child: Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 16,
                right: MediaQuery.of(context).size.width / 24),
            width: double.infinity,
            child: DropdownButton<String>(
              value: genderValue,
              // icon: const Icon(Icons.arrow_downward),
              icon: const SizedBox.shrink(),
              elevation: 9,
              style: const TextStyle(color: blackColor),
              // underline: Container(
              //   height: 2,
              //   color: blackColor,
              // ),
              onChanged: (String? newValue) {
                setState(() {
                  genderValue = newValue!;
                });
              },
              items: <String>['ذكر', 'أنثي']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      value,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
