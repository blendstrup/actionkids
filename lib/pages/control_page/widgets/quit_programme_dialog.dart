import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:io' show Platform;

class QuitProgrammeDialog extends StatelessWidget {
  QuitProgrammeDialog({required this.player, required this.child});

  final AudioPlayer player;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).cardColor,
              title: Text(
                'Vil du afslutte forløbet?',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              actions: [
                TextButton(
                  child: Text('Ja'),
                  onPressed: () {
                    //player.pause();
                    player.dispose();
                    Navigator.of(context).pop(true);
                  },
                ),
                TextButton(
                  child: Text('Nej'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            ),
          );
        } else if (Platform.isIOS) {
          return await showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text('Vil du afslutte forløbet?'),
              actions: [
                CupertinoDialogAction(
                  child: Text('Ja'),
                  onPressed: () {
                    //player.pause();
                    player.dispose();
                    Navigator.of(context).pop(true);
                  },
                ),
                CupertinoDialogAction(
                  child: Text('Nej'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            ),
          );
        }

        return true;
      },
      child: child,
    );
  }
}
