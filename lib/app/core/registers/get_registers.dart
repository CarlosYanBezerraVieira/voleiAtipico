import 'package:get_it/get_it.dart';
import 'package:voleiatipico/app/core/registers/edit_register.dart';
import 'package:voleiatipico/app/data/preferences_implemet.dart';

import 'core_register.dart';
import 'player_register.dart';

GetIt getIt = GetIt.instance;

Future<void> setupRegisters() async {
  await PreferencesImplemet
      .initialize(); // Certifique-se que SharedPreferences está inicializado.

  coreRegister();
  playerRegister();
  editplayerRegister();
}
