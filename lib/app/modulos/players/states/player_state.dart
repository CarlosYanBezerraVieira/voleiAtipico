import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

abstract class PlayerState {
  final List<PlayerModel> players;
  PlayerState({required this.players});

  factory PlayerState.initial() => PlayerStateInitial(players: []);
  PlayerState loading() {
    return PlayerStateLoading(players: players);
  }

  PlayerState success({List<PlayerModel>? players}) {
    return PlayerStateSuccess(players: players ?? this.players);
  }

  PlayerState error(String message, Object? error) {
    return PlayerStateError(
        message: message, exception: error, players: players);
  }
}

/// Representa o estado inicial do player
class PlayerStateInitial extends PlayerState {
  PlayerStateInitial({required super.players});
}

/// Representa o estado de carregamento dos players
class PlayerStateLoading extends PlayerState {
  PlayerStateLoading({required super.players});
}

/// Representa o estado de sucesso, com a lista de players
class PlayerStateSuccess extends PlayerState {
  PlayerStateSuccess({required super.players});
}

/// Representa um erro com uma mensagem associada
class PlayerStateError extends PlayerState {
  final String message;

  final Object? exception;

  PlayerStateError(
      {required this.message, this.exception, required super.players});
}
