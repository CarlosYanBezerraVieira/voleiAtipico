import 'package:voleiatipico/app/core/registers/get_registers.dart';
import 'package:voleiatipico/app/modulos/home/store/home_player_store.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service.dart';
import 'package:voleiatipico/app/modulos/players/store/edit_player_store.dart';

void editplayerRegister() {
  getIt.registerSingleton<EditPlayerStore>(
    EditPlayerStore(
        playerService: getIt<PlayerService>(),
        homePlayerStore: getIt<HomePlayerStore>()),
  );
}
