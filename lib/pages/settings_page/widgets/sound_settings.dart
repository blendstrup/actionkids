import 'package:flutter/material.dart';
import 'switch_row.dart';
import '/state/settings_providers.dart';

class SoundSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchRow(
            title: 'Musik',
            provider: isMusicOnProvider,
          ),
          SwitchRow(
            title: 'Stemme',
            provider: isVoiceOnProvider,
          ),
        ],
      ),
    );
  }
}
