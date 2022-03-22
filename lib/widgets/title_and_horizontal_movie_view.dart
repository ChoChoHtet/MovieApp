import 'package:flutter/material.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';

import '../data/vos/movie_vo.dart';
import '../resources/dimens.dart';
import '../viewItems/movie_view.dart';

class TitleAndHorizontalMovieView extends StatelessWidget {
  final Function(int?) onTapMovie;
  final List<MovieVO>? getNowPlayingMovies;
  final String title;

  const TitleAndHorizontalMovieView(
      {required this.onTapMovie,
        required this.getNowPlayingMovies,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: MARGIN_MEDIUM_2),
          child: TitleText(title),
        ),
        SizedBox(
          height: 16,
        ),
        HorizontalMoviesList(
          onTapMovie: (movieId) => onTapMovie(movieId),
          movieList: getNowPlayingMovies,
        ),
      ],
    );
  }
}

class HorizontalMoviesList extends StatelessWidget {
  final Function(int?) onTapMovie;
  final List<MovieVO>? movieList;

  const HorizontalMoviesList(
      {required this.onTapMovie, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIES_LIST_HEIGHT,
      child: (movieList != null)
          ? ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        itemCount: movieList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => onTapMovie(movieList?[index].id),
            child: MovieView(
              movieList?[index],
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}