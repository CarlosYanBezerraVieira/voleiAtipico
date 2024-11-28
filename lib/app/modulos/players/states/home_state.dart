import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

abstract class HomeState {
  final List<PlayerModel> players;
  HomeState({required this.players});

  factory HomeState.initial() => PlayerStateInitial(players: []);
  HomeState loading() {
    return PlayerStateLoading(players: players);
  }

  HomeState success({List<PlayerModel>? players}) {
    return PlayerStateSuccess(players: players ?? this.players);
  }

  HomeState error(String message, Object? error) {
    return PlayerStateError(
        message: message, exception: error, players: players);
  }
}

/// Representa o estado inicial do player
class PlayerStateInitial extends HomeState {
  PlayerStateInitial({required super.players});
}

/// Representa o estado de carregamento dos players
class PlayerStateLoading extends HomeState {
  PlayerStateLoading({required super.players});
}

/// Representa o estado de sucesso, com a lista de players
class PlayerStateSuccess extends HomeState {
  PlayerStateSuccess({required super.players});
}

/// Representa um erro com uma mensagem associada
class PlayerStateError extends HomeState {
  final String message;

  final Object? exception;

  PlayerStateError(
      {required this.message, this.exception, required super.players});
}
