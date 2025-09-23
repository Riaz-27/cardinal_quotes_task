import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/core/models/wallpaper.dart';
import 'package:cardinal_quotes_task/core/widgets/wallpaper_card.dart';
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
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
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
            return WallpaperCard(
              wallpaper: wallpaper,
              isShowMenu: false,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
