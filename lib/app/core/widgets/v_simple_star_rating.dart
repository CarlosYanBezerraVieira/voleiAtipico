// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class VSimpleStarRating extends StatelessWidget {
  final double? size;
  final double rating;

  final void Function(double?)? onRated;
  const VSimpleStarRating({
    super.key,
    this.size,
    this.onRated,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleStarRating(
      allowHalfRating: true,
      starCount: 5,
      rating: rating,
      size: size ?? 20,
      onRated: onRated,
      spacing: 8,
    );
  }
}
