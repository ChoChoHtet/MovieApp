

import '../../data/vos/actors_vo.dart';

abstract class ActorDao {
  void saveAllActors(List<ActorsVO> actorList);
  List<ActorsVO> getAllActors();

}
