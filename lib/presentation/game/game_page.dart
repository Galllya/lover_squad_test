import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:lover_squad_test/presentation/game/app_game.dart';

class GamePage extends StatelessWidget {
  final String imageType;
  const GamePage({
    super.key,
    required this.imageType,
  });

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: AppGame(
        imageType: imageType,
        onFinish: () => Navigator.of(context).pop(),
      ),
    );
  }
}
