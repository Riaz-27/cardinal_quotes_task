import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/core/models/quotes.dart';
import 'package:cardinal_quotes_task/core/models/sound.dart';
import 'package:cardinal_quotes_task/core/models/wallpaper.dart';
import 'package:cardinal_quotes_task/core/widgets/sound_card.dart';
import 'package:cardinal_quotes_task/features/saved/views/widgets/custom_chip_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/widgets/quotes_card.dart';
import '../../../../core/widgets/wallpaper_card.dart';
import '../../../sound/view/pages/sound_player_page.dart';

class SavedPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const SavedPage());

  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final _chipNames = ['Audios', 'Quotes', 'Wallpapers', 'Memorial Cards'];
  final _chipActiveIcons = [
    'assets/icons/nav_icons/sounds_active.svg',
    'assets/icons/nav_icons/top_active.svg',
    'assets/icons/menu_icons/wallpaper.svg',
    'assets/icons/menu_icons/memorial_cards.svg',
  ];
  final _chipInactiveIcons = [
    'assets/icons/nav_icons/sounds_inactive.svg',
    'assets/icons/nav_icons/top_inactive.svg',
    'assets/icons/menu_icons/wallpaper.svg',
    'assets/icons/menu_icons/memorial_cards.svg',
  ];
  final _isActive = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    List<Sound> savedSounds = [];
    List<Quotes> savedQuotes = [];
    List<Wallpaper> savedWallpapers = [];

    for (
      int i = 0;
      i < sounds.length || i < quotes.length || i < wallpapers.length;
      i++
    ) {
      if (i < sounds.length) {
        final sound = Sound.fromMap(sounds[i]);
        if (sound.isSaved) {
          savedSounds.add(sound);
        }
      }
      if (i < quotes.length) {
        final quote = Quotes.fromMap(quotes[i]);
        if (quote.isSaved) {
          savedQuotes.add(quote);
        }
      }
      if (i < wallpapers.length) {
        final wallpaper = Wallpaper.fromMap(wallpapers[i]);
        if (wallpaper.isSaved) {
          savedWallpapers.add(wallpaper);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Save'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              size: 26,
              color: AppPalette.color1,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _chipNames.length,
              itemBuilder: (context, index) {
                final isActive = _isActive[index];
                final chipName = _chipNames[index];
                final chipActiveIcon = _chipActiveIcons[index];
                final chipInactiveIcon = _chipInactiveIcons[index];
                return CustomChipButton(
                  chipName: chipName,
                  chipActiveIcon: chipActiveIcon,
                  chipInactiveIcon: chipInactiveIcon,
                  isActive: isActive,
                  onTap: () {
                    setState(() {
                      _isActive.fillRange(0, 4, false);
                      _isActive[index] = true;
                    });
                  },
                );
              },
            ),
          ),
          if (_isActive[0])
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: savedSounds.length,
                        itemBuilder: (context, index) {
                          final sound = savedSounds[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: SoundCard(
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).push(
                                  SoundPlayerPage.route(
                                    sound: sound,
                                    appbarTitle: 'Saved Audios',
                                  ),
                                );
                              },
                              sound: sound,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if (_isActive[1] || _isActive[3])
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shrinkWrap: true,
                itemCount: savedQuotes.length,
                itemBuilder: (context, index) {
                  final quote = savedQuotes[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: QuotesCard(quote: quote),
                  );
                },
              ),
            ),
          if (_isActive[2])
            Expanded(
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
                itemCount: savedWallpapers.length,
                itemBuilder: (context, index) {
                  final wallpaper = savedWallpapers[index];
                  return WallpaperCard(
                    wallpaper: wallpaper,
                    isShowMenu: false,
                    index: index,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
