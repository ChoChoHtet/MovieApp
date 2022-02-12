import 'package:flutter/material.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/api_constants.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/widgets/play_button_view.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  final MovieVO? movie;

  ShowCaseView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SHOW_CASE_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: ShowCaseImageView(
              imgUrl: movie?.posterPath ?? "",
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TitleAndDateView(
              title: movie?.title ?? "",
              releaseDate: movie?.releaseDate ?? "",
            ),
          )
        ],
      ),
    );
  }
}

class TitleAndDateView extends StatelessWidget {
  final String title;
  final String releaseDate;

  TitleAndDateView({required this.title, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_3x),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          TitleText(releaseDate),
        ],
      ),
    );
  }
}

class ShowCaseImageView extends StatelessWidget {
  final String imgUrl;

  ShowCaseImageView({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGES_BASE_URL$imgUrl",
      fit: BoxFit.cover,
    );
  }
}
