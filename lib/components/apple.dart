import 'dart:ui';
import 'package:chichi_v1/hedgehogGame.dart';
import 'package:flame/sprite.dart';

class Apple {
  final HedgehogGame game;
  Sprite appleSprite;
  Rect appleRect;
  double lowerBorderForApple;
  bool isOnGround = false;
  double appleSpeed;
  double gravity;

  Apple(this.game, double x, double y) {
    appleSprite = Sprite('apple.PNG');
    appleRect = Rect.fromLTWH(x, y, game.appleTileSize, game.appleTileSize);
    lowerBorderForApple = game.screenSize.height - game.appleTileSize;
    appleSpeed = 0;
    gravity = 9.81;

  }

  void render(Canvas canvas) {
    appleSprite.renderRect(canvas, appleRect);
  }

  void update(double t) {
    if (game.chichi.hedgehogRect.top - appleRect.top < 1.0 && appleRect.left > game.chichi.hedgehogRect.left && appleRect.right < game.chichi.hedgehogRect.right) {
      appleRect = appleRect.translate(game.hedgehogDistance, 0);
    }
    else if (appleRect.top < lowerBorderForApple) {
      // Current Speed = Starting speed + Gravity * time
      appleSpeed = appleSpeed + gravity * t;
      // distance travelled during t = current speed * time
      double distance = appleSpeed * t;
      appleRect = appleRect.translate(0, distance);
    } else {
      isOnGround = true;
    }
  }

}