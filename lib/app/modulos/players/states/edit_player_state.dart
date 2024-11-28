import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

abstract class EditPlayerState {
  final PlayerModel player;

  EditPlayerState({required this.player});

  factory EditPlayerState.initial() =>
      EditPlayerStateInitial(player: PlayerModel.init());

  EditPlayerState loading() => EditPlayerStateLoading(player: player);

  EditPlayerState success(PlayerModel? player) =>
      EditPlayerStateSuccess(player: player ?? this.player);

  EditPlayerState error(String message, Object? exception) =>
      EditPlayerStateError(
          message: message, exception: exception, player: player);
}

class EditPlayerStateInitial extends EditPlayerState {
  EditPlayerStateInitial({required super.player});
}

class EditPlayerStateLoading extends EditPlayerState {
  EditPlayerStateLoading({required super.player});
}

class EditPlayerStateSuccess extends EditPlayerState {
  EditPlayerStateSuccess({required super.player});
}

class EditPlayerStateError extends EditPlayerState {
  final String message;
  final Object? exception;

  EditPlayerStateError(
      {required this.message, this.exception, required super.player});
}
