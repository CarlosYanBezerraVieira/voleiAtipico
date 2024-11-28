import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';

class VButton extends StatelessWidget {
  final String label;
  final bool loading;
  final void Function()? onPressed;
  const VButton(
      {super.key, required this.label, this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellowPrimary,
      ),
      onPressed: onPressed,
      child: Visibility(
        visible: !loading,
        replacement: const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            )),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
