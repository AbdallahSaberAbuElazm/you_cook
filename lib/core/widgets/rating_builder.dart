import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';

class RatingBuilder extends StatefulWidget {
  final double? itemSize;
  final double rating;

  const RatingBuilder({
    Key? key,
    required this.rating,
    required this.itemSize,
  }) : super(key: key);

  @override
  State<RatingBuilder> createState() => _RatingBuilderState();
}

class _RatingBuilderState extends State<RatingBuilder> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
          allowHalfRating: true,
          initialRating: widget.rating,
          itemSize: widget.itemSize!,
          updateOnDrag: false,
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0xfff9aa33),
              ),
          onRatingUpdate: (rating) {
            setState(() {
              Controllers.selectedVariableController.updateNewRating(rating);
            });
          }),
    );
  }
}
