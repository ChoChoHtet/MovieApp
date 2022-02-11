import 'package:flutter/material.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/api_constants.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/widgets/gradient_view.dart';
import 'package:module_3_movies_app/widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  final MovieVO? movie;
  const BannerView({required this.movie}) ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(imgUrl: movie?.posterPath ?? "",),
        ),
       GradientView(),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(title: movie?.title ?? "",),
        ),
        Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        ),
      ],
    );
  }
}


class BannerTitleView extends StatelessWidget {
  final String title;
  BannerTitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
          ),
          Text(
            "Official Review",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  final String imgUrl;
  const BannerImageView({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfiriR-FHvLJPueRrAtOuoLpBV6noy2mtNxw&usqp=CAU",
      "$IMAGES_BASE_URL$imgUrl" ,
      fit: BoxFit.cover,
    );
  }
}
