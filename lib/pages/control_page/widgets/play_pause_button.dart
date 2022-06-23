import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    Key? key,
    required this.player,
  }) : super(key: key);

  final AudioPlayer player;

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  IconData icon = Icons.pause;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (widget.player.playing) {
          widget.player.pause();
          setState(() {
            icon = Icons.play_arrow;
          });
        } else if (!widget.player.playing) {
          widget.player.play();
          setState(() {
            icon = Icons.pause;
          });
        }
      },
      //   widget.player.playing ? widget.player.pause() : widget.player.play(),
      icon: Icon(icon),
      iconSize: 48,
      splashRadius: 36,
    );
  }
}
