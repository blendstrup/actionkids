import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    required this.imagePath,
    required this.blurHash,
    required this.routePath,
    required this.title,
    required this.textColor,
  });

  final String imagePath;
  final String blurHash;
  final String routePath;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(routePath),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: OctoImage(
                  width: double.infinity,
                  image: AssetImage(imagePath),
                  placeholderBuilder: OctoPlaceholder.blurHash(blurHash),
                  //fadeInCurve: Curves.easeIn,
                  fadeInDuration: Duration(milliseconds: 20),
                  //errorBuilder: OctoError.icon(color: Colors.red),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed(routePath),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: textColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
