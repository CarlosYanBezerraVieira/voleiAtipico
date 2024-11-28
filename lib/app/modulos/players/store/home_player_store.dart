import 'package:flutter/material.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service.dart';
import 'package:voleiatipico/app/modulos/players/states/home_state.dart';

class HomePlayerStore extends ValueNotifier<HomeState> {
  final PlayerService _playerService;

  HomePlayerStore({
    required PlayerService playerService,
  })  : _playerService = playerService,
        super(HomeState.initial());

  // Função para buscar os jogadores, usando a variável interna
  Future<void> fetchPlayers() async {
    value = value.loading();
    try {
      final players =
          await _playerService.fetchPlayers(); // Carregar jogadores uma vez
      value = value.success(players: players);
    } catch (e) {
      value = value.error(e.toString(), e);
    }
  }

  // Função para remover um jogador
  Future<void> deletePlayer(int id) async {
    try {
      final players = value.players.toList();
      final playerToRemove = players.firstWhere((p) => p.id == id);
      players.remove(playerToRemove); // Atualiza o estado interno
      await _playerService
          .savePlayers(players); // Salva a lista no armazenamento
      value = value.success(players: players);
    } on Exception catch (e) {
      value = value.error(e.toString(), e);
    }
  }
}
