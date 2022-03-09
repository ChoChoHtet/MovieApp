import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:module_3_movies_app/data/%20models/movie_model.dart';
import 'package:module_3_movies_app/data/%20models/movie_model_impl.dart';
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
  final List<String> genreList = [
    "ACTION",
    "ADVENTURE",
    "CRIMINAL",
    "DRAMA",
    "COMEDY"
  ];

  MovieModel _movieModel = MovieModelImpl();

  List<MovieVO>? getNowPlayingMovies;
  List<MovieVO>? getPopularMovies;
  List<GenreVO>? getGenres;
  List<MovieVO>? moviesByGenre;
  List<ActorsVO>? actors;
  List<MovieVO>? topRatedMovies;

  @override
  void initState() {
    //Network
   /* _movieModel.getNowPlayingMovies().then((value) {
      //refresh widget
      setState(() {
        getNowPlayingMovies = value;
      });
    }).catchError((error) {
      debugPrint("Now Playing error: $error");
    });*/
    //Local
    _movieModel.getNowPlayingFromDatabase().then((playingMovies){
      setState(() {
        debugPrint("Now Playing DB : $playingMovies");
        getNowPlayingMovies = playingMovies ;
      });
    }).catchError((error){
      debugPrint("Now Playing DB error: $error");
    });

    //Network
   /* _movieModel.getPopularMovies().then((value) {
      setState(() {
        getPopularMovies = value;
      });
    }).catchError((error) {
      debugPrint("Popular error: $error");
    });*/
    //Local
    _movieModel.getPopularFromDatabase().then((popularMovies){
      setState(() {
        getPopularMovies = popularMovies ;
      });
    }).catchError((error){
      debugPrint("Popular DB error: $error");
    });

    //Network
    _movieModel.getGenres().then((value) {
     // debugPrint("Genre Response: ${value.toString()}");
      setState(() {
        getGenres = value;
      });
      _getMovieByGenreId(value?.first.id ?? 0);
    }).catchError((error) {
      debugPrint("Genre error: $error");
    });

    //Local
    _movieModel.getGenresFromDatabase().then((genreList){
      setState(() {
       getGenres = genreList ;
      });
    }).catchError((error){
      debugPrint("Genre DB error: $error");
    });

    //Network
   /* _movieModel.getTopRatedMovies().then((value) {
      //refresh widget
      debugPrint("Top Rated Response: ${value.toString()}");
      setState(() {
        topRatedMovies = value;
      });
    }).catchError((error) {
      debugPrint("Top Rated error: $error");
    });*/
    _movieModel.getTopRatedFromDatabase().then((topRated){
      setState(() {
        topRatedMovies = topRated;
      });
    }).catchError((error){
      debugPrint("Top Rated DB error: $error");
    });
    //Network
    _movieModel.getActors().then((value) {
      //refresh widget
    //  debugPrint("Actor Response: ${value.toString()}");
      setState(() {
        actors = value;
      });
    }).catchError((error) {
      debugPrint("Actor error: $error");
    });
    //Local
    _movieModel.getActorsFromDatabase().then((value) {
      //refresh widget
     // debugPrint("Actor Response: ${value.toString()}");
      setState(() {
       actors = value;
      });
    }).catchError((error) {
      debugPrint("Actor DB error: $error");
    });
    super.initState();
  }

  void _getMovieByGenreId(int genreId) {
    _movieModel.getMoviesByGenreId(genreId).then((value) {
      setState(() {
        moviesByGenre = value;
      });
    }).catchError((error) {
      debugPrint("Movies By  error: $error");
    });
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
              BannerSection(
                movieList: getPopularMovies?.take(5).toList(),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              BestPopularAndSerialView(
                onTapMovie: (movieId) => _navigatorPushToMovieDetailScreen(context, movieId),
                getNowPlayingMovies: getNowPlayingMovies,
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              MoviesShowTimesSection(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              GenreSectionView(
               onTapMovie: (movieId) => _navigatorPushToMovieDetailScreen(context,movieId) ,
                genreList: getGenres,
                movieList: moviesByGenre,
                onChooseGenre: (genreId) {
                  if (genreId != null) {
                    _getMovieByGenreId(genreId);
                  }
                },
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              ShowCasesSection(
                topRatedMovies: topRatedMovies,
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              ActorsAndCreatorsSectionView(
                BEST_ACTOR_TITLE,
                BEST_ACTOR_SEE_MORE,
                actorList: actors,
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
          dotsCount:  widget.movieList?.length ?? 1,
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
