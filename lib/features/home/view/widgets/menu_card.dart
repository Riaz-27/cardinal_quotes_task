import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_palette.dart';

class MenuCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final double iconSize;
  const MenuCard({
    super.key,
    required this.iconPath,
    required this.title,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppPalette.color1,
        border: Border.all(
          color: AppPalette.color3Variant,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: iconSize,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              AppPalette.color3,
              BlendMode.srcIn,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.visible,
              height: 1,
              wordSpacing: 100,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
