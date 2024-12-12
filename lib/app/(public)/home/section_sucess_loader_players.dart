import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:voleiatipico/app/(public)/home/sections/header_home.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_empty.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';
import 'package:voleiatipico/routes.g.dart';
import 'sections/header_informations.dart';
import 'widgets/card_player.dart';

class SectionSucessLoaderPlayers extends StatefulWidget {
  final List<PlayerModel> players;

  final void Function(int id) deletePlayer;
  const SectionSucessLoaderPlayers({
    super.key,
    required this.players,
    required this.deletePlayer,
  });

  @override
  State<SectionSucessLoaderPlayers> createState() =>
      _SectionSucessLoaderPlayersState();
}

class _SectionSucessLoaderPlayersState
    extends State<SectionSucessLoaderPlayers> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 180,
          toolbarHeight: 0,
          collapsedHeight: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: SizedBox.shrink(),
          ),
          backgroundColor: AppColors.yellowPrimary,
          flexibleSpace: FlexibleSpaceBar(
            background: HeaderHome(),
          ),
        ),
        const SliverToBoxAdapter(
          child: Column(
            children: [
              HeaderInformations(),
            ],
          ),
        ),
        if (widget.players.isNotEmpty)
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: widget.players.length,
            (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 8),
                child: CardPlayer(
                    player: widget.players[index],
                    onTap: (player) {
                      Routefly.push(routePaths.home.editPlayer.editPlayer,
                          arguments: player);
                    },
                    delete: (id) {
                      widget.deletePlayer(id);
                    }),
              );
            },
          )),
        if (widget.players.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: VEmpty(),
            ),
          ),
      ],
    );
  }
}
