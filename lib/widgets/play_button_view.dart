

import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';

class PlayButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.play_circle_fill,
      size: PLAY_BUTTON_SIZE,
      color: PLAY_BUTTON_COLOR,
    );
  }
}
