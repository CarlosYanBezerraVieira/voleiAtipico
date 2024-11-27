import 'package:voleiatipico/app/core/registers/get_registers.dart';
import 'package:voleiatipico/app/data/data_interface.dart';
import 'package:voleiatipico/app/data/preferences_implemet.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service.dart';
import 'package:voleiatipico/app/modulos/players/services/player_service_impl.dart';

void coreRegister() {
  getIt.registerLazySingleton<DataInterface>(() => PreferencesImplemet());
  getIt.registerSingleton<PlayerService>(
      PlayerServiceImpl(dataInterface: getIt<DataInterface>()));
}
