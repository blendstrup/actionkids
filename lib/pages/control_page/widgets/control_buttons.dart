import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import '/data/models/module_model.dart';
import '/state/settings_providers.dart';
import 'play_pause_button.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({
    Key? key,
    required this.isFirst,
    required this.player,
    required this.isLast,
    required this.module,
    required this.previousModule,
    required this.nextModule,
  }) : super(key: key);

  final bool isFirst;
  final AudioPlayer player;
  final bool isLast;
  final Module module;
  final Module previousModule;
  final Module nextModule;

  void back() {
    //int indexToSeek = module.introIndex - previousModule.loopCount - 2;

    if (player.loopMode == LoopMode.one) player.setLoopMode(LoopMode.off);

    if (module.introIndex == 1) {
      player.seek(Duration(seconds: 0), index: 0);
    } else {
      player.seek(Duration(seconds: 0), index: previousModule.introIndex);
    }
  }

  void next() {
    //int indexToSeek = module.introIndex + module.loopCount + 2;

    if (player.loopMode == LoopMode.one) player.setLoopMode(LoopMode.off);

    if (isFirst)
      player.seek(Duration(seconds: 0), index: 1);
    else {
      player.seek(Duration(seconds: 0), index: nextModule.introIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: isFirst ? false : true,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: TextButton(
            onPressed: () => back(),
            child: Container(child: Text('Tilbage'), width: 75),
          ),
        ),
        SizedBox(width: 40),
        PlayPauseButton(player: player),
        SizedBox(width: 40),
        Visibility(
          visible: isLast ? false : true,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Consumer(
            builder: (context, watch, child) {
              bool isAutomatic = watch(isAutomaticProvider).state;

              if (isAutomatic)
                return TextButton(
                    onPressed: () => next(),
                    child: Container(child: Text('Næste'), width: 75));
              else
                return ElevatedButton(
                    onPressed: () => next(), child: Text('Næste'));
            },
          ),
        ),
      ],
    );
  }
}
