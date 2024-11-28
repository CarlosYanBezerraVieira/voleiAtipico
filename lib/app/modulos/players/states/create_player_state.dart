import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

abstract class CreatePlayerState {
  final PlayerModel player;

  CreatePlayerState({required this.player});

  factory CreatePlayerState.initial() =>
      CreatePlayerStateInitial(player: PlayerModel.init());

  CreatePlayerState loading() => CreatePlayerStateLoading(player: player);

  CreatePlayerState success(PlayerModel? player) =>
      CreatePlayerStateSuccess(player: player ?? this.player);

  CreatePlayerState error(String message, Object? exception) =>
      CreatePlayerStateError(
          message: message, exception: exception, player: player);
}

class CreatePlayerStateInitial extends CreatePlayerState {
  CreatePlayerStateInitial({required super.player});
}

class CreatePlayerStateLoading extends CreatePlayerState {
  CreatePlayerStateLoading({required super.player});
}

class CreatePlayerStateSuccess extends CreatePlayerState {
  CreatePlayerStateSuccess({required super.player});
}

class CreatePlayerStateError extends CreatePlayerState {
  final String message;
  final Object? exception;

  CreatePlayerStateError(
      {required this.message, this.exception, required super.player});
}
