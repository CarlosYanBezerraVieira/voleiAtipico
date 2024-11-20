import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:voleiatipico/routes.g.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 1,
        ), () {
      Routefly.navigate(routePaths.home);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Container(),
    );
  }
}
