import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:cardinal_quotes_task/core/widgets/card_action_menu.dart';
import 'package:cardinal_quotes_task/core/widgets/card_info.dart';
import 'package:cardinal_quotes_task/core/models/sound.dart';
import 'package:cardinal_quotes_task/features/sound/view/widgets/meditaion_play_card.dart';
import 'package:cardinal_quotes_task/features/sound/view/widgets/sound_play_card.dart';
import 'package:flutter/material.dart';

class SoundPlayerPage extends StatefulWidget {
  static MaterialPageRoute route({
    required Sound sound,
    required String appbarTitle,
  }) => MaterialPageRoute(
    builder: (context) => SoundPlayerPage(
      sound: sound,
      appbarTitle: appbarTitle,
    ),
  );

  final Sound sound;
  final String appbarTitle;

  const SoundPlayerPage({
    super.key,
    required this.sound,
    required this.appbarTitle,
  });

  @override
  State<SoundPlayerPage> createState() => _SoundPlayerPageState();
}

class _SoundPlayerPageState extends State<SoundPlayerPage> {
  double selectedVolume = 0.6;
  double selectedPosition = 0.25;

  @override
  Widget build(BuildContext context) {
    bool isMeditation() {
      final title = widget.appbarTitle.toLowerCase();
      if (title.contains('meditation') || title.contains('exercise')) {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appbarTitle),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isMeditation()
                ? MeditaionPlayCard(imageUrl: widget.sound.imageUrl)
                : SoundPlayCard(imageUrl: widget.sound.imageUrl),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_outline_rounded,
                      size: 80,
                      color: AppPalette.color1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 140,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Slider(
                            activeColor: AppPalette.color3,
                            inactiveColor: AppPalette.color1,
                            value: selectedVolume,
                            onChanged: (val) {
                              setState(() {
                                selectedVolume = val;
                              });
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.volume_down_rounded,
                          color: AppPalette.color1,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '04:00',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppPalette.color1,
                  ),
                ),
                Text(
                  '12:00',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppPalette.color1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Slider(
              padding: const EdgeInsets.symmetric(vertical: 10),
              activeColor: AppPalette.color3,
              inactiveColor: AppPalette.color1,
              value: selectedPosition,
              onChanged: (val) {
                setState(() {
                  selectedPosition = val;
                });
              },
            ),
            CardInfo(
              tags: widget.sound.tags,
              soundTitle: widget.sound.title,
            ),
            CardActionMenu(
              views: widget.sound.views,
            ),
          ],
        ),
      ),
    );
  }
}
