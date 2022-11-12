import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/widgets/rating_builder.dart';

class RatingBuilderWithNumber extends StatelessWidget {
  final double ratingNumber;
  final double ratingItemSize;
  final String textDescriptionNumber;
  final double fontTextSize;
  const RatingBuilderWithNumber(
      {Key? key,
      required this.ratingNumber,
      required this.ratingItemSize,
      required this.textDescriptionNumber,
      required this.fontTextSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBuilder(rating: ratingNumber, itemSize: ratingItemSize),
        descriptionRating(
            text: textDescriptionNumber, fontSizeText: fontTextSize),
      ],
    );
  }

  Widget descriptionRating(
      {required String text, required double fontSizeText}) {
    return SizedBox(
      child: Text(
        text,
        style: TextStyle(
          color: greyColor,
          fontSize: fontSizeText,
          fontFamily: 'NotoKufiArabic',
        ),
      ),
    );
  }
}
