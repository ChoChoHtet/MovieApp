import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/colors.dart';

class GradientView extends StatelessWidget {
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
