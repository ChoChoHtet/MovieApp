import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/persistence/daos/actor_dao.dart';

class ActorDaoImplMock extends ActorDao{
  Map<int,ActorsVO> actorListFromDBMock = {};

  @override
  List<ActorsVO> getAllActors() {
    return actorListFromDBMock.values.toList();
  }

  @override
  void saveAllActors(List<ActorsVO> actorList) {
    actorList.forEach((actor) {
      actorListFromDBMock[actor.id ?? 0] = actor ;
    });
  }

}