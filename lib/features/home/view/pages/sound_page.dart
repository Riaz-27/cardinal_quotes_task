import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/core/models/sound.dart';
import 'package:cardinal_quotes_task/features/home/view/widgets/sound_card.dart';
import 'package:cardinal_quotes_task/features/sound/view/pages/sound_player_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class SoundPage extends StatelessWidget {
  static MaterialPageRoute route(appbarTitle) => MaterialPageRoute(
    builder: (context) => SoundPage(
      appbarTitle: appbarTitle,
    ),
  );

  final String appbarTitle;
  const SoundPage({
    super.key,
    required this.appbarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle),
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sounds.length,
                  itemBuilder: (context, index) {
                    final sound = Sound.fromMap(sounds[index]);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: SoundCard(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).push(
                            SoundPlayerPage.route(
                              sound: sound,
                              appbarTitle: appbarTitle,
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
    );
  }
}
