import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class MeditaionPlayCard extends StatelessWidget {
  final String imageUrl;
  const MeditaionPlayCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 275,
            width: 275,
            decoration: BoxDecoration(
              color: AppPalette.color1,
              borderRadius: BorderRadius.circular(10000),
            ),
          ),
          Container(
            height: 240,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: AppPalette.colorgg,
            ),
          ),
          Container(
            height: 216,
            width: 216,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: AppPalette.color1,
            ),
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
