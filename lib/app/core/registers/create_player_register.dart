import 'package:voleiatipico/app/core/registers/get_registers.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service/player_service.dart';
import 'package:voleiatipico/app/modulos/players/store/create_player_store.dart';
import 'package:voleiatipico/app/modulos/players/store/home_player_store.dart';

void playerRegister() {
  getIt.registerSingleton<CreatePlayerStore>(CreatePlayerStore(
    playerService: getIt<PlayerService>(),
    homePlayerStore: getIt<HomePlayerStore>(),
  ));
}
