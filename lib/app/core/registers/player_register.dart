import 'package:voleiatipico/app/core/registers/get_registers.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service.dart';
import 'package:voleiatipico/app/modulos/players/store/player_store.dart';

void playerRegister() {
  getIt.registerSingleton<PlayerStore>(
      PlayerStore(playerService: getIt<PlayerService>()));
}
