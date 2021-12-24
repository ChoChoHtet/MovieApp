import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(),
        ),
        BannerGradientView(),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(),
        ),
        Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        ),
      ],
    );
  }
}

class BannerGradientView extends StatelessWidget {
  const BannerGradientView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              HOME_SCREEN_BACKGROUND_COLOR,
            ]),
      ),
    );
  }
}

class BannerTitleView extends StatelessWidget {
  const BannerTitleView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The wolverine 2013",
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
  const BannerImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfiriR-FHvLJPueRrAtOuoLpBV6noy2mtNxw&usqp=CAU",
      fit: BoxFit.cover,
    );
  }
}
