import 'package:flutter/material.dart';
import 'package:voleiatipico/app/(public)/home/widgets/list_players.dart';
import 'package:voleiatipico/app/core/get_registers.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';
import 'package:voleiatipico/app/modulos/players/states/player_state.dart';
import 'package:voleiatipico/app/modulos/players/store/player_store.dart';
import 'package:voleiatipico/app/widgets/v_error.dart';
import 'package:voleiatipico/app/widgets/v_init.dart';
import 'package:voleiatipico/app/widgets/v_loading.dart';

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
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ValueListenableBuilder<PlayerState>(
          valueListenable: playerStore,
          builder: (context, store, _) {
            if (store is PlayerStateInitial) {
              return VInitPage(callback: playerStore.fetchPlayers);
            } else if (store is PlayerStateLoading) {
              return const VLoading();
            } else if (store is PlayerStateSuccess) {
              return SizedBox(
                  height: 500,
                  child: ListPlayers(
                      players: store.players,
                      onTap: (player) {
                        playerStore.updatePlayer(player);
                      },
                      delete: (id) {
                        playerStore.deletePlayer(id);
                      }));
            } else if (store is PlayerStateError) {
              return VError(
                message: store.message,
              );
            }
            return const SizedBox.shrink();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          playerStore.addPlayer(PlayerModel(
              name: 'Teste', rate: 4.0, position: Position.central));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
