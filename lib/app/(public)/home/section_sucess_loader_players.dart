import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:voleiatipico/app/(public)/home/sections/header_home.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';
import 'package:voleiatipico/routes.g.dart';
import 'widgets/card_player.dart';

class SectionSucessLoaderPlayers extends StatelessWidget {
  final List<PlayerModel> players;
  final void Function(int id) deletePlayer;
  const SectionSucessLoaderPlayers({
    super.key,
    required this.players,
    required this.deletePlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const HeaderHome(),
        Expanded(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
            child: Column(
              children: [
                ...players.map((player) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CardPlayer(
                        player: player,
                        onTap: (player) {
                          Routefly.push(routePaths.home.editPlayer.editPlayer,
                              arguments: player);
                        },
                        delete: (id) {
                          deletePlayer(id);
                        }),
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
