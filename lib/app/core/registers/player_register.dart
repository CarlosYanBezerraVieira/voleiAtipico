import 'package:voleiatipico/app/core/get_registers.dart';
import 'package:voleiatipico/app/data/preferences_implemet.dart';
import 'package:voleiatipico/app/modulos/players/store/player_store.dart';

void playerRegister() {
  getIt.registerSingleton<PlayerStore>(
    PlayerStore(preferencesImplemet: getIt<PreferencesImplemet>()),
  );
}
