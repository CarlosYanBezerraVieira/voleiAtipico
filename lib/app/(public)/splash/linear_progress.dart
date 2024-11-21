import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/theme/app_colors.dart';

class LinearProgress extends StatelessWidget {
  const LinearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      color: AppColors.yellowPrimary,
      backgroundColor: AppColors.white,
      minHeight: 5,
    );
  }
}
