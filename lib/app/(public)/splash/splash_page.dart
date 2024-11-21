import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:voleiatipico/app/core/theme/app_colors.dart';
import 'package:voleiatipico/routes.g.dart';

import 'linear_progress.dart';

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
          seconds: 2,
        ), () {
      Routefly.navigate(routePaths.home.path);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.white,
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://thumbs.dreamstime.com/b/isolated-vector-illustration-male-player-volleyball-outline-style-appearance-male-volleyball-abstract-facet-179691697.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          child: RotatedBox(
              quarterTurns: 3, // Rotação de 90 graus no sentido anti-horário
              child: LinearProgress()),
        ),
        const Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: RotatedBox(
              quarterTurns: 3, // Rotação de 90 graus no sentido anti-horário
              child: LinearProgress()),
        ),
        const Positioned(top: 0, right: 0, left: 0, child: LinearProgress()),
        const Positioned(bottom: 0, right: 0, left: 0, child: LinearProgress()),
      ],
    );
  }
}
