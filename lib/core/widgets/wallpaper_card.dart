import 'package:cardinal_quotes_task/core/models/wallpaper.dart';
import 'package:flutter/material.dart';

import '../theme/app_palette.dart';
import 'wallpaper_popup.dart';

class WallpaperCard extends StatefulWidget {
  final Wallpaper wallpaper;
  final bool isShowMenu;
  final int index;

  const WallpaperCard({
    super.key,
    required this.wallpaper,
    required this.isShowMenu,
    required this.index,
  });

  @override
  State<WallpaperCard> createState() => _WallpaperCardState();
}

class _WallpaperCardState extends State<WallpaperCard> {
  bool isShowMenu = false;

  @override
  Widget build(BuildContext context) {
    String tags = '';
    for (final tag in widget.wallpaper.tags) {
      tags += '$tag   ';
    }

    return Stack(
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    tags,
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppPalette.color1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowMenu = !isShowMenu;
                    });
                  },
                  child: const Icon(
                    Icons.more_vert,
                    size: 20,
                    color: AppPalette.color1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.wallpaper.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 15,
          top: 10,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isShowMenu ? 1 : 0,
            child: WallpaperPopup(
              wallpaper: widget.wallpaper,
              onClose: () {
                setState(() {
                  isShowMenu = false;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
