import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class WallpaperPopupMenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool flip;
  const WallpaperPopupMenuButton({
    super.key,
    required this.icon,
    required this.title,
    this.flip = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 18,
          width: 35,
          child: Transform.flip(
            flipX: flip,
            child: Icon(
              icon,
              size: 20,
              color: AppPalette.color3,
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppPalette.color3,
          ),
        ),
      ],
    );
  }
}
