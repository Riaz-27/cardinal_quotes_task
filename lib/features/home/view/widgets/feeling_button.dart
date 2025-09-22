import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_palette.dart';

class FeelingButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  const FeelingButton({
    super.key,
    this.onTap,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 16,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              color: AppPalette.color3,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
