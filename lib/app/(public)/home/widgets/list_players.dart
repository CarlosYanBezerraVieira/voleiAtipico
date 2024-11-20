import 'package:flutter/material.dart';
import 'package:voleiatipico/app/(public)/home/widgets/card_player.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

class ListPlayers extends StatelessWidget {
  final List<PlayerModel> players;
  final void Function(PlayerModel player) onTap;
  final void Function(int id) delete;

  const ListPlayers(
      {super.key,
      required this.players,
      required this.onTap,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return CardPlayer(player: player, onTap: onTap, delete: delete);
      },
    );
  }
}
