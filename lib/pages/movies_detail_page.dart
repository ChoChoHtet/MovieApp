import 'package:flutter/material.dart';
import 'package:module_3_movies_app/bloc/movie_detail_bloc.dart';
import 'package:module_3_movies_app/data/%20models/movie_model.dart';
import 'package:module_3_movies_app/data/%20models/movie_model_impl.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/network/api_constants.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/resources/strings.dart';
import 'package:module_3_movies_app/widgets/actors_and_creators_section_view.dart';
import 'package:module_3_movies_app/widgets/gradient_view.dart';
import 'package:module_3_movies_app/widgets/rating_view.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';
import 'package:provider/provider.dart';

import '../data/vos/movie_vo.dart';

//movie
class MovieDetailPage extends StatelessWidget {
  final int? movieId;

  MovieDetailPage({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieDetailBloc(movieId ?? 0),
      child: Scaffold(
        body: Consumer<MovieDetailBloc>(
          builder: (BuildContext context, bloc, Widget? child) {
            return Container(
              color: HOME_SCREEN_BACKGROUND_COLOR,
              child: (bloc.mMovie != null)
                  ? CustomScrollView(
                      slivers: [
                        MovieDetailsSliverAppView(
                          () {
                            Navigator.pop(context);
                          },
                          movie: bloc.mMovie,
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate(<Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: MARGIN_MEDIUM_2,
                                horizontal: MARGIN_MEDIUM_2),
                            child: TrailerSectionView(
                              genreList:
                                  bloc.mMovie?.getGenreAsStringList() ?? [],
                              storyLine: bloc.mMovie?.overview ?? "",
                            ),
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          ActorsAndCreatorsSectionView(
                            MOVIES_DETAIL_ACTORS_TITLE,
                            "",
                            seeMoreButtonVisibility: false,
                            actorList: bloc.mCast,
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          Container(
                            padding: EdgeInsets.all(MARGIN_MEDIUM_2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText("ABOUT FILM"),
                                SizedBox(
                                  height: MARGIN_MEDIUM_2,
                                ),
                                AboutFilmInfoView(
                                  "Original Title:",
                                  bloc.mMovie?.originalTitle ?? "",
                                ),
                                SizedBox(
                                  height: MARGIN_MEDIUM_2,
                                ),
                                AboutFilmInfoView(
                                  "Type:",
                                  bloc.mMovie
                                          ?.getGenreSeparatedAsCommonString() ??
                                      "",
                                ),
                                SizedBox(
                                  height: MARGIN_MEDIUM_2,
                                ),
                                AboutFilmInfoView(
                                  "Production:",
                                  bloc.mMovie
                                          ?.getProductionCountriesAsString() ??
                                      "",
                                ),
                                SizedBox(
                                  height: MARGIN_MEDIUM_2,
                                ),
                                AboutFilmInfoView(
                                  "Premiere:",
                                  bloc.mMovie?.releaseDate ?? "",
                                ),
                                SizedBox(
                                  height: MARGIN_MEDIUM_2,
                                ),
                                AboutFilmInfoView("Description:",
                                    bloc.mMovie?.overview ?? ""),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          (bloc.mCrew != null && bloc.mCrew!.isNotEmpty)
                              ? ActorsAndCreatorsSectionView(
                                  MOVIES_DETAIL_CREATORS_TITLE,
                                  MOVIES_DETAIL_CREATORS_SEE_MORE,
                                  actorList: bloc.mCrew,
                                )
                              : Container(),
                        ]))
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            );
          },
        ),
      ),
    );
  }
}

class AboutFilmInfoView extends StatelessWidget {
  final String titleText;
  final String descriptionText;

  const AboutFilmInfoView(this.titleText, this.descriptionText);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            titleText,
            style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                color: MOVIES_DETAIL_FILM_INFO_TEXT_COLOR,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MARGIN_CARD_MEDIUM_2,
        ),
        Expanded(
          child: Text(
            descriptionText,
            style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class TrailerSectionView extends StatelessWidget {
  final List<String> genreList;
  final String storyLine;

  const TrailerSectionView({required this.genreList, required this.storyLine});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoviesTimeAndGenreView(genreList),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        StoryLineView(
          overview: storyLine,
        ),
        SizedBox(
          height: MARGIN_XLARGE,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
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
  final String overview;

  StoryLineView({required this.overview});

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
          overview,
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
  final List<String> genreList;

  const MoviesTimeAndGenreView(this.genreList);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      //row
      alignment: WrapAlignment.start,
      //column
      crossAxisAlignment: WrapCrossAlignment.center,
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
        //combine with wrap using spread operations
        ...genreList
            .map(
              (genre) => GenreChipView(genre),
            )
            .toList(),
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
      //wrap content
      mainAxisSize: MainAxisSize.min,
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
  final Function onTapBack;
  final MovieVO? movie;

  const MovieDetailsSliverAppView(this.onTapBack, {required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: false,
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAIL_SLIVER_APP_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailImageView(
                posterPath: movie?.posterPath ?? "",
              ),
            ),
            GradientView(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: MARGIN_XLARGE, left: MARGIN_MEDIUM_2),
                child: BackButtonView(onTapBack),
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
                child: MovieDetailsInfoView(
                  movie: movie,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailsInfoView extends StatelessWidget {
  final MovieVO? movie;

  MovieDetailsInfoView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MovieDetailsYearView(
              releaseYear: movie?.releaseDate?.substring(0, 4) ?? "",
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RatingView(),
                    TitleText("${movie?.voteCount ?? 0} VOTES"),
                    SizedBox(
                      height: MARGIN_MEDIUM,
                    ),
                  ],
                ),
                SizedBox(
                  width: MARGIN_CARD_MEDIUM_2,
                ),
                Text(
                  "${movie?.voteAverage ?? 0}",
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
          movie?.title ?? "",
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
  final String releaseYear;

  MovieDetailsYearView({required this.releaseYear});

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
          releaseYear,
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
  final Function onTapBack;

  const BackButtonView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBack();
      },
      child: Container(
        width: MARGIN_XXLARGE,
        height: MARGIN_XXLARGE,
        decoration:
            BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
        child: Icon(
          Icons.chevron_left,
          size: MARGIN_XLARGE,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MovieDetailImageView extends StatelessWidget {
  final String? posterPath;

  MovieDetailImageView({required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGES_BASE_URL$posterPath",
      fit: BoxFit.cover,
    );
  }
}
