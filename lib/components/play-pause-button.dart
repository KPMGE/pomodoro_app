import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  final void Function() onPlay;
  final void Function() onPause;

  const PlayPauseButton({
    super.key,
    required this.onPlay,
    required this.onPause,
  });

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  bool _isPaused = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isPaused = !_isPaused;
        });
        if (_isPaused) {
          super.widget.onPause();
        } else {
          super.widget.onPlay();
        }
      },
      color: Colors.black54,
      iconSize: 70,
      icon: Icon(_isPaused
          ? Icons.pause_circle_filled_rounded
          : Icons.play_circle_rounded),
    );
  }
}
