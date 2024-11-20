import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:voleiatipico/app/data/preferences_implemet.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';
import 'package:voleiatipico/app/modulos/players/states/player_state.dart';

class PlayerStore extends ValueNotifier<PlayerState> {
  final PreferencesImplemet _preferencesImplemet;

  PlayerStore({
    required PreferencesImplemet preferencesImplemet,
  })  : _preferencesImplemet = preferencesImplemet,
        super(PlayerState.initial());

  // Função para buscar os jogadores, usando a variável interna
  Future<void> fetchPlayers() async {
    value = value.loading();
    try {
      final players =
          await _loadPlayersFromPreferences(); // Carregar jogadores uma vez
      value = value.success(players: players);
    } catch (e) {
      value = value.error(e.toString(), e);
    }
  }

  // Função para carregar os jogadores do armazenamento (já em memória)
  Future<List<PlayerModel>> _loadPlayersFromPreferences() async {
    final data = await _preferencesImplemet.getData('players');
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return List<PlayerModel>.from(
        jsonDecode(data).map((x) => PlayerModel.fromMap(x)).toList(),
      );
    }
  }

  // Função para adicionar um jogador
  Future<void> addPlayer(PlayerModel player) async {
    value = value.loading();
    final players = value.players.toList();
    players.add(player); // Atualiza o estado interno
    await _savePlayers(players);
    // Salva a lista no armazenamento
    value = value.success(players: players);
  }

  // Função para remover um jogador
  Future<void> deletePlayer(int id) async {
    try {
      final players = value.players.toList();
      final playerToRemove = players.firstWhere((p) => p.id == id);
      players.remove(playerToRemove); // Atualiza o estado interno
      await _savePlayers(players); // Salva a lista no armazenamento
      value = value.success(players: players);
    } on Exception catch (e) {
      value = value.error(e.toString(), e);
    }
  }

  // Função para atualizar um jogador
  Future<void> updatePlayer(PlayerModel player) async {
    try {
      final players = value.players.toList();

      final index = players.indexWhere((p) => p.id == player.id);
      players[index] = player; // Atualiza o estado interno
      await _savePlayers(players); // Salva a lista no armazenamento
      value = value.success(players: players);
    } on Exception catch (e) {
      value = value.error(e.toString(), e);
    }
  }

  // Função para salvar a lista de jogadores no armazenamento
  Future<void> _savePlayers(List<PlayerModel> players) async {
    await _preferencesImplemet.updateData(
        'players', jsonEncode(players.map((e) => e.toMap()).toList()));
  }
}
