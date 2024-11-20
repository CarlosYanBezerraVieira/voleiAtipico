import 'package:voleiatipico/app/core/get_registers.dart';
import 'package:voleiatipico/app/data/preferences_implemet.dart';

void coreRegister() {
  getIt.registerLazySingleton<PreferencesImplemet>(() => PreferencesImplemet());
}
