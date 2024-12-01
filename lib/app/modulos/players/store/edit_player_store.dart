import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/mixin/image_picker_notifier_mixin.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service/player_service.dart';
import 'package:voleiatipico/app/modulos/players/store/home_player_store.dart';
import '../states/edit_player_state.dart';

class EditPlayerStore extends ValueNotifier<EditPlayerState>
    with ImagePickerNotifierMixin {
  final PlayerService _playerService;
  final HomePlayerStore _homePlayerStore;

  EditPlayerStore({
    required HomePlayerStore homePlayerStore,
    required PlayerService playerService,
  })  : _playerService = playerService,
        _homePlayerStore = homePlayerStore,
        super(EditPlayerState.initial());

  void updateName(String name) {
    value = value.success(value.player.copyWith(name: name));
  }

  void updatePosition(Position? position) {
    value = value.success(value.player.copyWith(position: position));
  }

  void updateRate(double? rate) {
    value = value.success(value.player.copyWith(rate: rate));
  }

  void updateImage() async {
    final image = await pickImageFromGallery();

    value = value.success(value.player.copyWith(pathImage: image.path));
  }

  bool get loading => value is EditPlayerStateLoading;
  double get rate => value.player.rate;
  String get name => value.player.name;
  Position get position => value.player.position;

  void loadData(PlayerModel playerModel) {
    value = value.success(playerModel);
  }

  // Função para edit um jogador
  Future<void> updatePlayer() async {
    try {
      value = value.loading();
      await Future.delayed(const Duration(seconds: 2)); // Simula uma requisição
      final players = await _playerService.fetchPlayers();
      // Carregar jogadores uma vez
      final index = players.indexWhere((p) => p.id == value.player.id);
      players[index] = value.player;

      /// Atualiza o estado interno
      await _playerService.savePlayers(players);

      // Salva a lista no armazenamento
      value = value.success(value.player);
      _homePlayerStore.fetchPlayers();
    } catch (e) {
      value = value.error(e.toString(), e);
    }
  }

  void clear() {
    value = EditPlayerState.initial();
  }
}
