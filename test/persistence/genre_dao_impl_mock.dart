import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/persistence/daos/genre_dao.dart';

class GenreDaoImplMock extends GenreDao {
  Map<int, GenreVO> genreListFromDBMock = {};

  @override
  List<GenreVO> getAllGenres() {
    return genreListFromDBMock.values.toList();
  }

  @override
  void saveAllGenres(List<GenreVO> genreList) {
    genreList.forEach((genre) {
      genreListFromDBMock[genre.id ?? 0] = genre;
    });
  }
}
