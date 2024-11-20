import 'package:get_it/get_it.dart';
import 'package:voleiatipico/app/data/preferences_implemet.dart';

import 'registers/core_register.dart';
import 'registers/player_register.dart';

GetIt getIt = GetIt.instance;

Future<void> setupRegisters() async {
  await PreferencesImplemet
      .initialize(); // Certifique-se que SharedPreferences está inicializado.

  coreRegister();
  playerRegister();
}
