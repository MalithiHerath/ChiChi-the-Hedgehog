import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:chichi_v1/components/background.dart';
import 'package:chichi_v1/components/hedgeHog.dart';
import 'package:chichi_v1/components/apple.dart';

class HedgehogGame extends Game {
  Size screenSize;
  double hedgehogTileSize;
  double timer = 0;
  double difficulty = 0;
  Background forest;
  Hedgehog chichi;
  double hedgehogY;
  double hedgehogDistance = 0;
  double hedgehogSpeed = 0;
  double appleTileSize;
  List<Apple> apples;
  Random rnd;

  HedgehogGame() {
    initialize();
  }

  void initialize() async {
    rnd = Random();
    apples = List<Apple>();
    resize(await Flame.util.initialDimensions());
    forest = Background(this);
    spawnChichi();
    spawnApple();
  }

  void render(Canvas canvas) {
    forest.render(canvas);

    chichi.render(canvas);

    //Apples
    apples.forEach((Apple apple) => apple.render(canvas));

  }

  void update(double t) {
    if (timer > 3) {
      apples.removeWhere((Apple apple) => apple.isOnGround);
      bool coinFlip = rnd.nextBool();
      if (coinFlip) {
        spawnApple();
      }
      timer = 0;
      difficulty = difficulty + 0.001;
    } else {
      timer = timer + t + difficulty;
    }

    //Hedgehog
    chichi.update(t);

    //Apples
    apples.forEach((Apple apple) => apple.update(t));

  }

  void onTapDown(TapDownDetails d) {
    hedgehogSpeed = (screenSize.height - d.globalPosition.dy) + 1;
    if (d.globalPosition.dx < screenSize.width / 2) {
      hedgehogSpeed = hedgehogSpeed * -1;
    }
  }

  void onTapUp(TapUpDetails d) {
    hedgehogSpeed = 0;

  }

  void resize(Size size) {
    screenSize = size;
    hedgehogTileSize = screenSize.width / 10;
    appleTileSize = hedgehogTileSize / 3;
    hedgehogY = screenSize.height - 2 * hedgehogTileSize;
  }

  void spawnChichi() {
    chichi = Hedgehog(this, hedgehogTileSize, hedgehogY);
  }

  void spawnApple() {
    double x = rnd.nextDouble() * (screenSize.width - appleTileSize);
    apples.add(Apple(this, x, 0));
  }

}