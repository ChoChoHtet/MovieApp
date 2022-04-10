import 'package:hive/hive.dart';
import 'package:module_3_movies_app/persistence/daos/actor_dao.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';

import '../../../data/vos/actors_vo.dart';

///Dao class must be singleton
class ActorDaoImpl extends ActorDao {
  static final ActorDaoImpl _singleton = ActorDaoImpl._internal();

  ActorDaoImpl._internal();

  factory ActorDaoImpl() {
    return _singleton;
  }

  /// the following code are CRUD operations and Boxes like Map
  /// Box are key and values pair
  void saveAllActors(List<ActorsVO> actorList) async {
    ///change list to map
    Map<int, ActorsVO> actorMap = Map.fromIterable(actorList,
        key: (actor) => actor.id, value: (actor) => actor);
    await getActorBox().putAll(actorMap);
  }

  List<ActorsVO> getAllActors() {
    return getActorBox().values.toList();
  }

  Box<ActorsVO> getActorBox() {
    return Hive.box<ActorsVO>(BOX_NAMES_ACTOR_VO);
  }
}
