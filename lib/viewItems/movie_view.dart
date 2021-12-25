import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/widgets/rating_view.dart';

class MovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Container(
          margin: EdgeInsets.only(right: 8),
          width: MOVIES_LIST_WIDTH,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfiriR-FHvLJPueRrAtOuoLpBV6noy2mtNxw&usqp=CAU",
                fit: BoxFit.cover,
                height: 200,
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              Text(
                "Westworld",
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "8.20",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width:  MARGIN_MEDIUM,),
                 RatingView(),
                ],
              )
            ],
          ),
        )
    );
  }
}
