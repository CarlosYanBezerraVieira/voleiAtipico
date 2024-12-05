// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:voleiatipico/app/core/constant/keys_of_shared_preferences.dart';
import 'package:voleiatipico/app/data/data_interface.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service.dart';

class PlayerServiceImpl implements PlayerService {
  final DataInterface dataInterface;
  PlayerServiceImpl({
    required this.dataInterface,
  });
  @override
  Future<List<PlayerModel>> fetchPlayers() async {
    final data = await dataInterface.getData(playerKey);
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return List<PlayerModel>.from(
        jsonDecode(data).map((x) => PlayerModel.fromMap(x)).toList(),
      );
    }
  }

  @override
  Future<void> savePlayers(List<PlayerModel> players) async {
    await dataInterface.updateData(
        playerKey, jsonEncode(players.map((e) => e.toMap()).toList()));
  }
}
