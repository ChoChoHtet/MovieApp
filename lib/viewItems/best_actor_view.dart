import 'package:flutter/material.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/network/api_constants.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';

class BestActorView extends StatelessWidget {
  final ActorsVO? actor;
  BestActorView({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MOVIES_LIST_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(profileUrl: actor?.profilePath ?? "",),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FavoriteButtonView(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TitleAndLikeView(name: actor?.name ?? "",),
          ),
        ],
      ),
    );
  }
}

class TitleAndLikeView extends StatelessWidget {
  final String name;
  TitleAndLikeView({required this.name});
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
           name,
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
  final String profileUrl;
  ActorImageView({required this.profileUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGES_BASE_URL$profileUrl",
      fit: BoxFit.cover,
    );
  }
}
