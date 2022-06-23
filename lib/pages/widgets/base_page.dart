import 'package:actionkids/pages/widgets/appbar.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  BasePage({
    required this.title,
    required this.child,
    this.bottomBar,
    this.floatingActionButton,
    this.ignoreMargin,
  });

  final String title;
  final Widget child;
  final Widget? bottomBar;
  final Widget? floatingActionButton;
  final bool? ignoreMargin;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: Center(
          child: Container(
            width: ignoreMargin ?? false ? size.width : size.width * 0.85,
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            child: child,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomBar,
      ),
    );
  }
}
