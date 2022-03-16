import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:module_3_movies_app/bloc/home_bloc.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/pages/movies_detail_page.dart';
import 'package:module_3_movies_app/resources/colors.dart';
import 'package:module_3_movies_app/resources/dimens.dart';
import 'package:module_3_movies_app/resources/strings.dart';
import 'package:module_3_movies_app/viewItems/banner_view.dart';
import 'package:module_3_movies_app/viewItems/movie_view.dart';
import 'package:module_3_movies_app/viewItems/show_case_view.dart';
import 'package:module_3_movies_app/widgets/actors_and_creators_section_view.dart';
import 'package:module_3_movies_app/widgets/see_more_text.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';
import 'package:module_3_movies_app/widgets/title_with_see_more_text.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeBloc();
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
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
              StreamBuilder(
                stream: _bloc.mPopularStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<MovieVO>?> snapshot) {
                  return  BannerSection(
                    movieList:snapshot.data?.take(5).toList(),
                  );
                },
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              StreamBuilder(
               stream: _bloc.mNowPlayingStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<MovieVO>?> snapshot) {
                 return BestPopularAndSerialView(
                   onTapMovie: (movieId) => _navigatorPushToMovieDetailScreen(context, movieId),
                   getNowPlayingMovies:snapshot.data,
                 );
                },
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              MoviesShowTimesSection(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              StreamBuilder(
                stream: _bloc.mGenreListStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<GenreVO>?> genreSnapshot) {
                  return  StreamBuilder(
                    stream:_bloc.mMoviesGenreStreamController.stream ,
                    builder: (BuildContext context, AsyncSnapshot<List<MovieVO>?> snapshot) {
                      return  GenreSectionView(
                        onTapMovie: (movieId) => _navigatorPushToMovieDetailScreen(context,movieId) ,
                        genreList: genreSnapshot.data,
                        movieList:snapshot.data ,
                        onChooseGenre: (genreId) {
                          if (genreId != null) {
                            _bloc.getMovieByGenreAndRefresh(genreId);
                          }
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              StreamBuilder(
                stream: _bloc.mTopRatedStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<MovieVO>?> snapshot) {
                  return ShowCasesSection(
                    topRatedMovies: snapshot.data,
                  );
                },
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              StreamBuilder(
                stream: _bloc.mActorsStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<ActorsVO>?> snapshot) {
                  return ActorsAndCreatorsSectionView(
                    BEST_ACTOR_TITLE,
                    BEST_ACTOR_SEE_MORE,
                    actorList: snapshot.data,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigatorPushToMovieDetailScreen(BuildContext context, int? id) {
    if(id !=null){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailPage(
            movieId: id,
          ),
        ),
      );
    }

  }
}

class GenreSectionView extends StatelessWidget {
  final List<GenreVO>? genreList;
  final List<MovieVO>? movieList;
  final Function(int?) onTapMovie;
  final Function(int?) onChooseGenre;

  const GenreSectionView(
      {required this.onTapMovie,
      required this.genreList,
      required this.movieList,
      required this.onChooseGenre});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: DefaultTabController(
            length: genreList?.length ?? 0,
            child: TabBar(
              isScrollable: true,
              indicatorColor: PLAY_BUTTON_COLOR,
              unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
              tabs: genreList
                      ?.map(
                        (genre) => Tab(
                          child: Text(genre.name ?? ""),
                        ),
                      )
                      .toList() ??
                  [],
              onTap: (index) {
                onChooseGenre(genreList?[index].id);
              },
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: EdgeInsets.only(top: MARGIN_MEDIUM_2, bottom: MARGIN_LARGE),
          child: HorizontalMoviesList(
            onTapMovie: (movieId) => onTapMovie(movieId),
            movieList: movieList,
          ),
        ),
      ],
    );
  }
}

class MoviesShowTimesSection extends StatelessWidget {
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
  final List<MovieVO>? topRatedMovies;

  ShowCasesSection({required this.topRatedMovies});

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
            children: topRatedMovies
                    ?.map((movie) => ShowCaseView(movie: movie))
                    .toList() ??
                [],
          ),
        ),
      ],
    );
  }
}

class BestPopularAndSerialView extends StatelessWidget {
  final Function(int?) onTapMovie;
  final List<MovieVO>? getNowPlayingMovies;

  const BestPopularAndSerialView({required this.onTapMovie,required this.getNowPlayingMovies});

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
                  onTap:() => onTapMovie(movieList?[index].id),
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

class BannerSection extends StatefulWidget {
  final List<MovieVO>? movieList;

  const BannerSection({@required this.movieList});

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
            children: widget.movieList
                    ?.map((movie) => BannerView(
                          movie: movie,
                        ))
                    .toList() ??
                [],
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        DotsIndicator(
          //widget.movieList?.length ?? 1
          dotsCount:  (widget.movieList != null &&
              widget.movieList!.length > 0 ) ? widget.movieList!.length : 1,
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
