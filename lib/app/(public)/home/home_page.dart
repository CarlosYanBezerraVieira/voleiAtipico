import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:voleiatipico/app/core/get_registers.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';
import 'package:voleiatipico/app/modulos/players/states/player_state.dart';
import 'package:voleiatipico/app/modulos/players/store/player_store.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_error.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_init.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_loading.dart';
import 'package:voleiatipico/routes.g.dart';
import 'section_sucess_loader_players.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PlayerStore playerStore;

  @override
  void initState() {
    super.initState();
    playerStore = getIt<PlayerStore>();
    playerStore.fetchPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<PlayerState>(
          valueListenable: playerStore,
          builder: (context, store, _) {
            if (store is PlayerStateInitial) {
              return VInitPage(callback: playerStore.fetchPlayers);
            } else if (store is PlayerStateLoading) {
              return const VLoading();
            } else if (store is PlayerStateSuccess) {
              return SectionSucessLoaderPlayers(
                  players: store.players,
                  deletePlayer: playerStore.deletePlayer);
            } else if (store is PlayerStateError) {
              return VError(
                message: store.message,
              );
            }
            return const SizedBox.shrink();
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Routefly.push(routePaths.home.createPlayer.createPlayer);
          },
          backgroundColor: AppColors.yellowPrimary,
          child: const Icon(Icons.add)),
    );
  }
}
