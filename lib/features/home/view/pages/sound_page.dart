import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/features/home/model/sound.dart';
import 'package:cardinal_quotes_task/features/home/view/widgets/sound_card.dart';
import 'package:cardinal_quotes_task/features/sound/view/pages/sound_player.dart';
import 'package:flutter/material.dart';

class SoundPage extends StatelessWidget {
  const SoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Sounds'),
        ),
      ),
      body: Padding(
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
                        Navigator.of(context).push(SoundPlayer.route(sound));
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
    );
  }
}
