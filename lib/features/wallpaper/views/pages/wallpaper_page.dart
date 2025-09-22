import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/features/wallpaper/model/wallpaper.dart';
import 'package:cardinal_quotes_task/features/wallpaper/views/widgets/wallpaper_popup.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class WallpaperPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const WallpaperPage());

  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  List<bool> showMenu = List.filled(wallpapers.length, false);
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
              childAspectRatio: 0.8,
            ),
            itemCount: wallpapers.length,
            itemBuilder: (context, index) {
              final wallpaper = Wallpaper.fromMap(wallpapers[index]);
              String tags = '';
              for (final tag in wallpaper.tags) {
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
                                showMenu.fillRange(0, wallpapers.length, false);
                                showMenu[index] = !showMenu[index];
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
                                image: AssetImage(wallpaper.imageUrl),
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
                      opacity: showMenu[index] ? 1 : 0,
                      child: WallpaperPopup(
                        wallpaper: wallpaper,
                        onClose: () {
                          setState(() {
                            showMenu[index] = false;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
