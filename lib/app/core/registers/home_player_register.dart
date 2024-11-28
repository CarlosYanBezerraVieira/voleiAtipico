import 'package:voleiatipico/app/core/registers/get_registers.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service.dart';
import 'package:voleiatipico/app/modulos/players/store/home_player_store.dart';

void homePlayerRegister() {
  getIt.registerSingleton<HomePlayerStore>(
      HomePlayerStore(playerService: getIt<PlayerService>()));
}
