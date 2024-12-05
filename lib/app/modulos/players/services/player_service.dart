import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

abstract interface class PlayerService {
  Future<List<PlayerModel>> fetchPlayers();
  Future<void> savePlayers(List<PlayerModel> players);
}
