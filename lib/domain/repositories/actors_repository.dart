import 'package:myapp/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
