import 'package:flutter/material.dart';
import '/pages/widgets/base_page.dart';
import 'widgets/menu_card.dart';
import 'widgets/sponsor.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: '',
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Action Kids',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 40),
              ),
            ),
            SizedBox(height: 40),
            MenuCard(
              title: 'På Bondegården',
              textColor: Colors.black87,
              routePath: 'settings',
              imagePath: 'assets/images/bondegaarden-poster.jpg',
              blurHash: 'LiManbngpHt5KUsjaxjY\$askwtjX',
            ),
            SizedBox(height: 40),
            MenuCard(
              title: 'På Rumfart',
              textColor: Colors.black87,
              routePath: 'space',
              imagePath: 'assets/images/rumfart-poster.jpg',
              blurHash: 'LJC*2wwhm+wc4TX3D%oH.lNME1NH',
            ),
            SizedBox(height: 40),
            MenuCard(
              title: 'På Zoofari',
              textColor: Colors.black87,
              routePath: 'zoo',
              imagePath: 'assets/images/zoofari-poster.jpg',
              blurHash: 'LZHfthbxO+kEN9a*bwj^S\$V]o%jZ',
            ),
            SizedBox(height: 100),
            Sponsor(
              height: 20,
              widthPercent: 0.6,
              imagePath: 'assets/images/apmollerfonden.png',
              blurHash: 'L6M@cY%2%\$?w_3%MogRkKQxvMcVX',
            ),
            SizedBox(height: 10),
            Sponsor(
              height: 30,
              widthPercent: 0.4,
              imagePath: 'assets/images/trygfonden.png',
              blurHash: 'LWPhkFjZozkWrDjZjFaKqFeTV@ae',
            ),
          ],
        ),
      ),
    );
  }
}
