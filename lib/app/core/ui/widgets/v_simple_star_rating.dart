// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';

class VSimpleStarRating extends StatelessWidget {
  final double? size;
  final double rating;
  final bool isReadOnly;

  final void Function(double?)? onRated;
  const VSimpleStarRating({
    super.key,
    this.size,
    this.onRated,
    required this.rating,
    this.isReadOnly = true,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      rating: rating,
      size: size ?? 20,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star_half,
      defaultIconData: Icons.star_border,
      starCount: 5,
      allowHalfRating: true,
      spacing: 2.0,
      onRatingChanged: onRated,
      borderColor: AppColors.yellowPrimary,
      color: AppColors.yellowPrimary,
    );
  }
}
