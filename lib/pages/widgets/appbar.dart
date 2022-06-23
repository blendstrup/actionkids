import 'package:flutter/material.dart';

class CustomAppBar extends AppBar with PreferredSizeWidget {
  @override
  get preferredSize => Size.fromHeight(50);

  CustomAppBar({Key? key, Widget? title})
      : super(
          key: key,
          title: title ?? Text(''),
          centerTitle: true,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () => null,
                icon: Icon(Icons.cast),
                splashRadius: 24,
              ),
            ),
          ],
        );
}
