import 'package:flutter/material.dart';

class VError extends StatelessWidget {
  final String message;
  const VError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
