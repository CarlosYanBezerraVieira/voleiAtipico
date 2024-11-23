import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';

class VButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const VButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellowPrimary,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
