import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/widgets/play_button_view.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SHOW_CASE_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: ShowCaseImageView(),
          ),
          Align(
           alignment: Alignment.center,
           child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TitleAndDateView(),
          )
        ],
      ),
    );
  }
}

class TitleAndDateView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Passengers",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: TEXT_REGULAR_3x
          ),),
          SizedBox(height: MARGIN_MEDIUM,),
          TitleText("15 DECEMBER 20116"),
        ],
      ),
    );
  }
}

class ShowCaseImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://www.hollywoodreporter.com/wp-content/uploads/2016/12/passengers_still_1_publicity_-_h_2016.jpg",
      fit: BoxFit.cover,
    );
  }
}
