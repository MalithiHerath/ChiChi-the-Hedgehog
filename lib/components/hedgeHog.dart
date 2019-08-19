import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:chichi_v1/hedgehogGame.dart';

class Hedgehog {
  final HedgehogGame game;
  Sprite hedgehogSprite;
  Rect hedgehogRect;

  Hedgehog(this.game, double x, double y) {
    hedgehogSprite = Sprite('chichi.PNG');
    hedgehogRect = Rect.fromLTWH(x, y, game.hedgehogTileSize, game.hedgehogTileSize);
  }

  void render(Canvas canvas) {
    hedgehogSprite.renderRect(canvas, hedgehogRect);
  }

  void update(double t) {
    game.hedgehogDistance = game.hedgehogSpeed * t;
    double boundary = hedgehogRect.left + game.hedgehogDistance;

    if(boundary >= 0 && boundary <= game.screenSize.width - game.hedgehogTileSize) {
      hedgehogRect = hedgehogRect.translate(game.hedgehogDistance, 0);
    }
  }

}