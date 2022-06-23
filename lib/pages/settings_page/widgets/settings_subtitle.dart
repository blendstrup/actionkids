import 'package:flutter/material.dart';
import 'help_dialog.dart';

class SettingsSubtitle extends StatelessWidget {
  SettingsSubtitle({
    required this.subtitle,
    required this.dialogTitle,
    this.dialogContent,
  });

  final String subtitle;
  final String dialogTitle;
  final Widget? dialogContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headline2,
        ),
        IconButton(
          onPressed: () => appShowDialog(
            context: context,
            title: dialogTitle,
            content: dialogContent,
          ),
          icon: Icon(Icons.help_outline),
          splashRadius: 16,
        ),
      ],
    );
  }
}
