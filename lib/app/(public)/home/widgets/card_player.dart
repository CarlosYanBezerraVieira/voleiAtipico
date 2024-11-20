import 'package:flutter/material.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

class CardPlayer extends StatelessWidget {
  final PlayerModel player;
  final Function(PlayerModel player) onTap;
  final Function(int id) delete;

  const CardPlayer(
      {super.key,
      required this.player,
      required this.onTap,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(player.name),
      subtitle: Text(player.position.name),
      onTap: () {
        onTap(player);
      },
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          delete(player.id!);
        },
      ),
    );
  }
}
