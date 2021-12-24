

import 'package:flutter/material.dart';
import 'package:module_3_movies_app/resources/strings.dart';
import 'package:module_3_movies_app/widgets/see_more_text.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';

class TitleWithSeeMoreText extends StatelessWidget {
final String titleText;
final String seeMoreText;
TitleWithSeeMoreText(this.titleText,this.seeMoreText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(titleText),
        Spacer(),
        SeeMoreText(seeMoreText),
      ],
    );
  }
}
