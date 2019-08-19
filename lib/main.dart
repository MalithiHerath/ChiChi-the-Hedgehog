import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:chichi_v1/hedgehogGame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.landscapeRight);
  Flame.images.loadAll(<String>[
    'background.PNG',
    'foreground.PNG',
    'chichi.PNG',
    'apple.PNG',
  ]);

  HedgehogGame game = HedgehogGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  tapper.onTapUp = game.onTapUp;
  flameUtil.addGestureRecognizer(tapper);

}
