import 'package:cardinal_quotes_task/features/wallpaper/model/wallpaper.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';
import 'wallpaper_popup_menu_button.dart';

class WallpaperPopup extends StatelessWidget {
  final Wallpaper wallpaper;
  final VoidCallback onClose;
  const WallpaperPopup({
    super.key,
    required this.wallpaper,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.25,
          color: AppPalette.color3,
        ),
        color: AppPalette.color1,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            GestureDetector(
              onTap: onClose,
              child: const Padding(
                padding: EdgeInsets.only(right: 5, top: 5),
                child: Icon(
                  Icons.clear,
                  size: 18,
                  color: AppPalette.color3,
                ),
              ),
            ),
            WallpaperPopupMenuButton(
              icon: Icons.visibility,
              title: wallpaper.views,
            ),
            const WallpaperPopupMenuButton(
              icon: Icons.bookmark,
              title: 'Save',
            ),
            const WallpaperPopupMenuButton(
              icon: Icons.reply,
              flip: true,
              title: 'Share',
            ),
            const WallpaperPopupMenuButton(
              icon: Icons.save_alt,
              title: 'Download',
            ),
            const WallpaperPopupMenuButton(
              icon: Icons.wallpaper,
              title: 'Set',
            ),
          ],
        ),
      ),
    );
  }
}
