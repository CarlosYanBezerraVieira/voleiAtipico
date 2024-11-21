import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:voleiatipico/app/core/theme/app_colors.dart';

import '../routes.g.dart';
import 'core/theme/app_text.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.yellowLite,
        textTheme: AppTextTheme.textTheme,
        colorSchemeSeed: const Color(0xFFED9009),
      ),
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.splash,
      ),
    );
  }
}
