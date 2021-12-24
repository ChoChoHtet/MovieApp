import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/colors.dart';

class TitleText extends StatelessWidget {
  final String text;

  TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: HOME_SCREEN_LIST_TITLE_COLOR,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }
}
