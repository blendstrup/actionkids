import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class Sponsor extends StatelessWidget {
  Sponsor({
    required this.height,
    required this.widthPercent,
    required this.imagePath,
    required this.blurHash,
  });

  final double height;
  final double widthPercent;
  final String imagePath;
  final String blurHash;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * widthPercent,
      child: OctoImage(
        image: AssetImage(imagePath),
        placeholderBuilder: OctoPlaceholder.blurHash(blurHash),
        fadeInDuration: Duration(milliseconds: 20),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
