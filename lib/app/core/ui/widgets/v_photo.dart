import 'dart:io';

import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';

class VPhoto extends StatelessWidget {
  final double size;

  final String pathOfAsserts;
  final double? borderRadius;
  final void Function()? onTap;

  const VPhoto({
    super.key,
    this.size = 60,
    this.pathOfAsserts = "",
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: pathOfAsserts.isNotEmpty,
          replacement: SizedBox(
            width: size,
            height: size,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: AppColors.yellowPrimary,
                ),
                color: AppColors.yellowCard,
              ),
              child: Icon(
                Icons.person,
                color: AppColors.yellowPrimary,
                size: size * 0.5,
              ),
            ),
          ),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 100),
              image: DecorationImage(
                  fit: BoxFit.cover, image: FileImage(File(pathOfAsserts))),
            ),
          ),
        ),
        if (onTap != null)
          Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(100),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.yellowPrimary,
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              )),
      ],
    );
  }
}
