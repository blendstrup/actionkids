import 'package:flutter/material.dart';

class TopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Action Kids på bondegården knytter til fortællingen om livet på bondegården med forskellige dyr, lyde og øvelser.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              'Sværhedsgrad:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 10),
            Icon(Icons.star),
            Icon(Icons.star),
            Opacity(opacity: 0.3, child: Icon(Icons.star)),
            Opacity(opacity: 0.3, child: Icon(Icons.star)),
            Opacity(opacity: 0.3, child: Icon(Icons.star)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Anbefalet udstyr:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 10),
            Icon(Icons.speaker),
            SizedBox(width: 5),
            Icon(Icons.local_drink),
            SizedBox(width: 5),
            Icon(Icons.tv),
          ],
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
