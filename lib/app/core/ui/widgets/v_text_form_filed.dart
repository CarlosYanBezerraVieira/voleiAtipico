import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/ui/helpers/form_helper.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';

class VTextFormfiled extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const VTextFormfiled(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
      validator: validator,
      onTapOutside: (event) => context.unFocus(),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.yellowPrimary,
        ),
        filled: true,
        fillColor: AppColors.yellowLite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Borda arredondada
          borderSide: BorderSide.none, // Remove o contorno padrão
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: AppColors.yellowPrimary, // Cor da borda ao focar
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: AppColors.yellowPrimary, // Cor da borda habilitada
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red, // Cor da borda ao dar erro
            width: 2.0,
          ),
        ),
      ),
      controller: controller,
      onChanged: onChanged,
    );
  }
}
