import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:module_3_movies_app/resources/dimens.dart';

class RatingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  RatingBar.builder(
        initialRating: 5,
        itemSize:  MARGIN_MEDIUM_2,
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {});
  }
}
