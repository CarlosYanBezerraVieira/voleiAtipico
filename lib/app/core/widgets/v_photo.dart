import 'package:flutter/material.dart';

class VPhoto extends StatelessWidget {
  final double size;
  final String pathOfNetwork;
  final String pathOfAsserts;

  const VPhoto({
    super.key,
    this.size = 60,
    this.pathOfNetwork = "",
    this.pathOfAsserts = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: pathOfNetwork.isEmpty
              ? NetworkImage(pathOfNetwork)
              : AssetImage(pathOfAsserts),
        ),
      ),
    );
  }
}
