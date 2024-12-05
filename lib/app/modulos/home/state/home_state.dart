import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

abstract class HomeState {
  final List<PlayerModel> players;
  HomeState({required this.players});

  factory HomeState.initial() => HomeStateInitial(players: []);
  HomeState loading() {
    return HomeStateLoading(players: players);
  }

  HomeState success({List<PlayerModel>? players}) {
    return HomeStateSuccess(players: players ?? this.players);
  }

  HomeState error(String message, Object? error) {
    return HomeStateError(message: message, exception: error, players: players);
  }
}

/// Representa o estado inicial do player
class HomeStateInitial extends HomeState {
  HomeStateInitial({required super.players});
}

/// Representa o estado de carregamento dos players
class HomeStateLoading extends HomeState {
  HomeStateLoading({required super.players});
}

/// Representa o estado de sucesso, com a lista de players
class HomeStateSuccess extends HomeState {
  HomeStateSuccess({required super.players});
}

/// Representa um erro com uma mensagem associada
class HomeStateError extends HomeState {
  final String message;

  final Object? exception;

  HomeStateError(
      {required this.message, this.exception, required super.players});
}
