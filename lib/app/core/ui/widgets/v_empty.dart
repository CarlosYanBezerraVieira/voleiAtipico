import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';
import 'package:voleiatipico/app/core/ui/theme/app_images.dart';

class VEmpty extends StatelessWidget {
  final String messsage;
  final String pathImage;
  const VEmpty({
    super.key,
    this.messsage = 'Nenhum dado encontrado',
    this.pathImage = AppImages.ball,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          pathImage,
          width: 100,
          height: 100,
          color: AppColors.grey,
        ),
        const SizedBox(height: 24),
        Text(
          messsage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
