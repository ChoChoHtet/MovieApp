import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';

class BestActorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MOVIES_LIST_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FavoriteButtonView(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TitleAndLikeView(),
          ),
        ],
      ),
    );
  }
}

class TitleAndLikeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: MARGIN_MEDIUM,
        horizontal: MARGIN_MEDIUM_2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Leonardo DiCaprio",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_2X),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.amber,
              ),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              Text(
                "YOU LIKE 18 MOVIES",
                style: TextStyle(
                    color: HOME_SCREEN_LIST_TITLE_COLOR,
                    fontWeight: FontWeight.w400,
                    fontSize: MARGIN_CARD_MEDIUM_2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavoriteButtonView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM),
      child: Icon(
        Icons.favorite_border,
        color: Colors.white,
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://ca-times.brightspotcdn.com/dims4/default/b5274df/2147483647/strip/true/crop/5487x8230+0+0/resize/991x1486!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F84%2F02%2F5be20f5b4be89a6b0d1c76370aab%2Fla-photos-1staff-478108-en-0117-quentin-tarantino-jlc-20758.jpg",
      fit: BoxFit.cover,
    );
  }
}
