import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/features/wallpaper/model/wallpaper.dart';
import 'package:cardinal_quotes_task/features/wallpaper/views/widgets/wallpaper_popup_menu_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class WallpaperPage extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const WallpaperPage());

  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              size: 26,
              color: AppPalette.color1,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 160 / 190,
            ),
            itemCount: wallpapers.length,
            itemBuilder: (context, index) {
              final wallpaper = Wallpaper.fromMap(wallpapers[index]);
              String tags = '';
              for (final tag in wallpaper.tags) {
                tags += '$tag   ';
              }
              return GestureDetector(
                onTap: () {},
                child: Stack(
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
                              onTap: () {},
                              child: const Icon(
                                Icons.more_vert,
                                size: 20,
                                color: AppPalette.color1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(wallpaper.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 15,
                      top: 10,
                      child: Container(
                        width: 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 0.2,
                            color: AppPalette.color3,
                          ),
                          color: AppPalette.color1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 5,
                            left: 15,
                            bottom: 15,
                            top: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 5,
                            children: [
                              const Icon(
                                Icons.clear,
                                size: 18,
                                color: AppPalette.color3,
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
                                icon: Icons.download,
                                title: 'Download',
                              ),
                              const WallpaperPopupMenuButton(
                                icon: Icons.wallpaper,
                                title: 'Set',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
