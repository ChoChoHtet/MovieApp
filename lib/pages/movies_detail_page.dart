import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/resources/strings.dart';
import 'package:module_3_movies_app/widgets/actors_and_creators_section_view.dart';
import 'package:module_3_movies_app/widgets/gradient_view.dart';
import 'package:module_3_movies_app/widgets/rating_view.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';

class MovieDetailPage extends StatelessWidget {
  final List<String> genreList = ["Family", "Fantasy", "Adventure"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              MovieDetailsSliverAppView(),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: MARGIN_MEDIUM_2, horizontal: MARGIN_MEDIUM_2),
                  child: TrailerSectionView(genreList),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2,
                ),
                ActorsAndCreatorsSectionView(
                  MOVIES_DETAIL_ACTORS_TITLE,
                  "",
                  seeMoreButtonVisibility: false,
                ),
                ActorsAndCreatorsSectionView(
                  MOVIES_DETAIL_CREATORS_TITLE,
                  MOVIES_DETAIL_CREATORS_SEE_MORE,
                ),
              ]))
            ];
          },
          body: Center(
            child: Text("title"),
          ),
        ),
      ),
    );
  }
}

class TrailerSectionView extends StatelessWidget {
  final List<String> genreList;

  const TrailerSectionView(this.genreList);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: MoviesTimeAndGenreView(genreList: genreList),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        StoryLineView(),
        SizedBox(
          height: MARGIN_XLARGE,
        ),
        Row(
          children: [
            MovieDetailButtonView(
                MOVIES_DETAIL_PLAY_TRAILER,
                Icon(
                  Icons.play_circle_fill,
                  color: Colors.black54,
                ),
                PLAY_BUTTON_COLOR),
            SizedBox(
              width: MARGIN_MEDIUM_2,
            ),
            MovieDetailButtonView(
              MOVIES_DETAIL_RATE_MOVIE,
              Icon(
                Icons.star,
                color: PLAY_BUTTON_COLOR,
              ),
              HOME_SCREEN_BACKGROUND_COLOR,
              isGhostButton: true,
            ),
          ],
        ),
      ],
    );
  }
}

class MovieDetailButtonView extends StatelessWidget {
  final String text;
  final Icon buttonIcon;
  final Color backgroundColors;
  final bool isGhostButton;

  const MovieDetailButtonView(this.text, this.buttonIcon, this.backgroundColors,
      {this.isGhostButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIES_DETAIL_BUTTON_HEIGHT,
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        color: backgroundColors,
        borderRadius: BorderRadius.circular(MARGIN_XLARGE),
        border: isGhostButton
            ? Border.all(
                color: Colors.white,
                width: 2,
              )
            : null,
      ),
      child: Row(
        children: [
          buttonIcon,
          SizedBox(
            width: MARGIN_MEDIUM,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: TEXT_REGULAR_2X),
          )
        ],
      ),
    );
  }
}

class StoryLineView extends StatelessWidget {
  const StoryLineView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("STORYLINE"),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Text(
          "After Tina and Newt find Jacob and the suitcase, Tina takes them to her apartment and introduces them to Queenie, her Legilimens sister. Jacob and Queenie are mutually attracted, though American wizards are forbidden to have any contact with No-Majs. Newt takes ",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_3x,
          ),
        ),
      ],
    );
  }
}

class MoviesTimeAndGenreView extends StatelessWidget {
  const MoviesTimeAndGenreView({
    Key key,
    @required this.genreList,
  }) : super(key: key);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          color: PLAY_BUTTON_COLOR,
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Text(
          "2h 30 min",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Row(
          children: genreList
              .map(
                (genre) => GenreChipView(genre),
              )
              .toList(),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Icon(
          Icons.favorite_border,
          color: Colors.white,
        )
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String text;

  const GenreChipView(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          padding: EdgeInsets.all(MARGIN_MEDIUM),
          backgroundColor: MOVIES_DETAIL_CHIP_BACKGROUND_COLOR,
          label: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: TEXT_REGULAR_2X),
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        )
      ],
    );
  }
}

class MovieDetailsSliverAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAIL_SLIVER_APP_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailImageView(),
            ),
            GradientView(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: MARGIN_XLARGE, left: MARGIN_MEDIUM_2),
                child: BackButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: MARGIN_XLARGE + MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                ),
                child: SearchButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                  bottom: MARGIN_XLARGE,
                ),
                child: MovieDetailsInfoView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailsInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MovieDetailsYearView(),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RatingView(),
                    TitleText("38876 VOTES"),
                    SizedBox(
                      height: MARGIN_MEDIUM,
                    ),
                  ],
                ),
                SizedBox(
                  width: MARGIN_CARD_MEDIUM_2,
                ),
                Text(
                  "9,75",
                  style: TextStyle(
                      fontSize: MOVIE_DETAIL_RATING_TEXT_SIZE,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "Fantastic Beasts and where to find them",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class MovieDetailsYearView extends StatelessWidget {
  const MovieDetailsYearView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_XLARGE,
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        color: PLAY_BUTTON_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_LARGE),
      ),
      child: Center(
        child: Text(
          "2016",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  const SearchButtonView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      color: Colors.white,
      size: MARGIN_XLARGE,
    );
  }
}

class BackButtonView extends StatelessWidget {
  const BackButtonView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MARGIN_XXLARGE,
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
      child: Icon(
        Icons.chevron_left,
        size: MARGIN_XLARGE,
        color: Colors.white,
      ),
    );
  }
}

class MovieDetailImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://i.gadgets360cdn.com/large/Fantastic_Beasts_and_Where_to_Find_Them_review_1479385830208.jpeg",
      fit: BoxFit.cover,
    );
  }
}
