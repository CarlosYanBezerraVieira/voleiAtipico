import 'package:voleiatipico/app/core/registers/get_registers.dart';
import 'package:voleiatipico/app/modulos/home/store/home_player_store.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service.dart';

void homePlayerRegister() {
  getIt.registerLazySingleton<HomePlayerStore>(() => HomePlayerStore(
        playerService: getIt<PlayerService>(),
      ));
}
