

import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/viewItems/best_actor_view.dart';
import 'package:module_3_movies_app/widgets/title_with_see_more_text.dart';

class ActorsAndCreatorsSectionView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool seeMoreButtonVisibility;

  const ActorsAndCreatorsSectionView(this.titleText, this.seeMoreText,
      {this.seeMoreButtonVisibility = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.only(top: MARGIN_MEDIUM_2, bottom: MARGIN_XXLARGE),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: MARGIN_MEDIUM,
              horizontal: MARGIN_MEDIUM_2,
            ),
            child: TitleWithSeeMoreText(
              titleText,
              seeMoreText,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Container(
            height: BEST_ACTOR_HEIGHT,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: MARGIN_MEDIUM_2),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BestActorView(),
                  BestActorView(),
                  BestActorView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
