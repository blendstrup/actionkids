import 'package:flutter/material.dart';

class AKBottomAppBar extends StatelessWidget {
  AKBottomAppBar({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).cardColor,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
