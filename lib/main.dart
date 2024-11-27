import 'package:flutter/material.dart';

import 'package:voleiatipico/app/app_widget.dart';

import 'app/core/registers/get_registers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupRegisters();
  runApp(const AppWidget());
}
