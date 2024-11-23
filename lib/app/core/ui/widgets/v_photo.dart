import 'package:flutter/material.dart';

class VPhoto extends StatelessWidget {
  final double size;
  final String pathOfNetwork;
  final String pathOfAsserts;

  final double? borderRadius;

  const VPhoto({
    super.key,
    this.size = 60,
    this.pathOfNetwork = "",
    this.pathOfAsserts = "",
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 100),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: pathOfNetwork.isNotEmpty
              ? NetworkImage(pathOfNetwork)
              : AssetImage(pathOfAsserts),
        ),
      ),
    );
  }
}
