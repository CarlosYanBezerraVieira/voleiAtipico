import 'package:flutter/material.dart';

class VLoading extends StatelessWidget {
  const VLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
