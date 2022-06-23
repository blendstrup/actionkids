import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/pages/theme.dart';
import 'dart:io' show Platform;

Future<T?> appShowDialog<T>({
  required BuildContext context,
  required String title,
  Widget? content,
}) async {
  if (Platform.isAndroid) {
    return await showDialog(
      context: context,
      builder: (context) => MaterialHelpDialog(
        title: title,
        content: content,
      ),
    );
  } else if (Platform.isIOS) {
    return await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoHelpDialog(
        title: title,
        content: content,
      ),
    );
  }
}

class MaterialHelpDialog extends StatelessWidget {
  MaterialHelpDialog({required this.title, this.content});

  final String title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: Text(title),
      titleTextStyle: Theme.of(context).textTheme.headline2!.copyWith(
            fontSize: AppTheme.smallFontSize,
          ),
      content: content,
      contentTextStyle: Theme.of(context).textTheme.bodyText1,
      actions: [
        TextButton(
          child: Text('Okay'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

class CupertinoHelpDialog extends StatelessWidget {
  CupertinoHelpDialog({required this.title, this.content});

  final String title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: content,
      actions: [
        CupertinoDialogAction(
          child: Text('Okay'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
