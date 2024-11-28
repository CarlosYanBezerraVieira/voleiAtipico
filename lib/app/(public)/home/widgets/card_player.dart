import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_photo.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_simple_star_rating.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';

class CardPlayer extends StatelessWidget {
  final PlayerModel player;
  final Function(PlayerModel player) onTap;
  final Function(int id) delete;

  const CardPlayer(
      {super.key,
      required this.player,
      required this.onTap,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.yellowCard,
      child: InkWell(
        onTap: () => onTap(player),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  VPhoto(pathOfNetwork: player.pathImage),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          player.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          player.position.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  VSimpleStarRating(
                    rating: player.rate,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
