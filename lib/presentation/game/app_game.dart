import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:lover_squad_test/style/app_colors.dart';
import 'package:lover_squad_test/style/app_text_style.dart';

class AppGame extends FlameGame with TapCallbacks {
  final String imageType;
  final VoidCallback onFinish;
  SpriteComponent spriteComponent = SpriteComponent();

  AppGame({
    required this.imageType,
    required this.onFinish,
  });

  @override
  Color backgroundColor() => AppColors.endBackground;

  late double imageSide;
  int index = 1;

  @override
  Future<void> onLoad() async {
    imageSide = size[0] - 100;
    setImage();
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (index == 5) {
      showEndGame();
      index++;
    } else if (index < 5) {
      index++;
      remove(spriteComponent);
      setImage();
    }
    super.onTapDown(event);
  }

  void setImage() async {
    spriteComponent
      ..sprite = await loadSprite('${imageType}_$index.jpeg')
      ..size = Vector2(imageSide, imageSide)
      ..x = size[0] / 2 - imageSide / 2
      ..y = size[1] / 2 - imageSide / 2;

    add(spriteComponent);
  }

  void showEndGame() {
    remove(spriteComponent);
    TextComponent textComponent = TextBoxComponent(
      text: "Игра окончена",
    );
    textComponent
      ..textRenderer = TextPaint(
        style: AppTextStyle.endGame,
      )
      ..position = Vector2(size[0] / 2 - textComponent.width / 2, size[1] / 2);
    add(
      textComponent,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () {
        onFinish();
      },
    );
  }
}
