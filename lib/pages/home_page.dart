import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:module_3_movies_app/pages/movies_detail_page.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/resources/strings.dart';
import 'package:module_3_movies_app/viewItems/banner_view.dart';
import 'package:module_3_movies_app/viewItems/best_actor_view.dart';
import 'package:module_3_movies_app/viewItems/movie_view.dart';
import 'package:module_3_movies_app/viewItems/show_case_view.dart';
import 'package:module_3_movies_app/widgets/actors_and_creators_section_view.dart';
import 'package:module_3_movies_app/widgets/see_more_text.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';
import 'package:module_3_movies_app/widgets/title_with_see_more_text.dart';

class HomePage extends StatelessWidget {
  final List<String> genreList = [
    "ACTION",
    "ADVENTURE",
    "CRIMINAL",
    "DRAMA",
    "COMEDY"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text(APP_MAIN_SCREEN_TITLE),
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, MARGIN_MEDIUM_2, 0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerSection(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              BestPopularAndSerialView(() {
                _navigatorPushToMovieDetailScreen(context);
              }),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              MoviesShowTimesSection(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              GenreSectionView( ()=>  _navigatorPushToMovieDetailScreen(context),
                genreList: genreList,
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              ShowCasesSection(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              ActorsAndCreatorsSectionView(
                BEST_ACTOR_TITLE,
                BEST_ACTOR_SEE_MORE,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigatorPushToMovieDetailScreen(BuildContext context) {
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(),
      ),
    );
  }
}

class GenreSectionView extends StatelessWidget {
  final List<String> genreList;
  final Function onTapMovie;

  const GenreSectionView(this.onTapMovie, {@required this.genreList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: DefaultTabController(
            length: genreList.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: PLAY_BUTTON_COLOR,
              unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
              tabs: genreList
                  .map(
                    (genre) => Tab(
                      child: Text(genre),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: EdgeInsets.only(top: MARGIN_MEDIUM_2, bottom: MARGIN_LARGE),
          child: HorizontalMoviesList(onTapMovie),
        ),
      ],
    );
  }
}

class MoviesShowTimesSection extends StatelessWidget {
  const MoviesShowTimesSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SHOW_TIMES_HEIGHT,
      color: PRIMARY_COLOR,
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
      ),
      padding: EdgeInsets.all(
        MARGIN_LARGE,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CHECK_MOVIES_SHOW_TIMES,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_HEADING_1X,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              SeeMoreText(
                SEE_MORE,
                textColor: PLAY_BUTTON_COLOR,
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.location_on_rounded,
            color: Colors.white,
            size: PLAY_BUTTON_SIZE,
          ),
        ],
      ),
    );
  }
}

class ShowCasesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: MARGIN_MEDIUM_2),
          child: TitleWithSeeMoreText(SHOW_CASES_TITLE, SHOW_CASES_SEE_MORE),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Container(
          height: SHOW_CASE_HEIGHT,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                vertical: MARGIN_MEDIUM, horizontal: MARGIN_MEDIUM_2),
            children: [
              ShowCaseView(),
              ShowCaseView(),
              ShowCaseView(),
            ],
          ),
        ),
      ],
    );
  }
}

class BestPopularAndSerialView extends StatelessWidget {
  final Function onTapMovie;

  const BestPopularAndSerialView(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: MARGIN_MEDIUM_2),
          child: TitleText("BEST POPULAR MOVIES AND SERIALS"),
        ),
        SizedBox(
          height: 16,
        ),
        HorizontalMoviesList(onTapMovie),
      ],
    );
  }
}

class HorizontalMoviesList extends StatelessWidget {
  final Function onTapMovie;

  const HorizontalMoviesList(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIES_LIST_HEIGHT,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return MovieView(onTapMovie);
        },
      ),
    );
  }
}

class BannerSection extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: [
              BannerView(),
              BannerView(),
              BannerView(),
            ],
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        DotsIndicator(
          dotsCount: 3,
          position: _position,
          decorator: DotsDecorator(
            color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLOR,
            activeColor: PLAY_BUTTON_COLOR,
          ),
        )
      ],
    );
  }
}
