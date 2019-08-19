import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:chichi_v1/hedgehogGame.dart';

class Background{

  final HedgehogGame game;
  Sprite backgroundSprite;
  Rect backgroundRect;
  double aspectRatio = 2760 / 1080;

  Background(this.game) {
    backgroundSprite = Sprite('background.PNG');
    backgroundRect = Rect.fromLTWH(
      0,
      0,
      game.screenSize.height * aspectRatio,
      game.screenSize.height,
    );
  }

  void render(Canvas canvas) {

    backgroundSprite.renderRect(canvas, backgroundRect);

  }

  void update(double t) {

  }
}