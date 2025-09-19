import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopMenuCard extends StatelessWidget {
  final String iconPath;
  final String title;

  const TopMenuCard({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppPalette.color1,
        border: Border.all(
          color: AppPalette.color3Variant,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 25,
            // width: 25,
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
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
