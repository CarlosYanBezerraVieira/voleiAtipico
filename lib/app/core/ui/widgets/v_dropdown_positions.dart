import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

class VDropdownPositions extends StatelessWidget {
  final String label;
  final void Function(Position?)? onSelected;
  final Position? initialSelection;
  const VDropdownPositions(
      {super.key, this.onSelected, this.initialSelection, required this.label});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: initialSelection,
      label: Text(
        label,
      ),
      width: double.infinity,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.yellowPrimary),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.yellowPrimary),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.yellowPrimary),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onSelected: onSelected,
      dropdownMenuEntries: [
        ...Position.values.map((e) => DropdownMenuEntry(
              value: e,
              label: e.name,
            )),
      ],
    );
  }
}
