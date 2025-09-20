import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:cardinal_quotes_task/features/home/model/sound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SoundPlayer extends StatelessWidget {
  static MaterialPageRoute route(Sound sound) =>
      MaterialPageRoute(builder: (context) => SoundPlayer(sound: sound));
  final Sound sound;
  const SoundPlayer({super.key, required this.sound});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Sounds'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 330,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: AppPalette.color1,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 196,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/sounds/sounds1.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        'assets/icons/sound_wave.svg',
                        height: 80,
                        colorFilter: const ColorFilter.mode(
                          AppPalette.color3,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
