import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ikke fundet :(',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tilbage'),
            ),
          ],
        ),
      ),
    );
  }
}
