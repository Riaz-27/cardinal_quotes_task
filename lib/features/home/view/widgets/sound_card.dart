import 'package:cardinal_quotes_task/features/home/model/sound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_palette.dart';
import 'custom_button.dart';

class SoundCard extends StatelessWidget {
  final Sound sound;
  final VoidCallback? onTap;
  final VoidCallback? onShare;
  final VoidCallback? onDownload;
  final VoidCallback? onSave;

  const SoundCard({
    super.key,
    required this.sound,
    this.onTap,
    this.onShare,
    this.onDownload,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 227,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        sound.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 161,
                    width: 168,
                    decoration: BoxDecoration(
                      color: AppPalette.color1,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 142,
                              height: 97,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(
                                    sound.imageUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/sound_wave.svg',
                              height: 111,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 2,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 20,
                                color: AppPalette.color3,
                              ),
                              Text(
                                '10:00',
                                style: TextStyle(
                                  color: AppPalette.color3,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(34),
                            value: 1,
                            color: AppPalette.color3,
                            backgroundColor: AppPalette.color3.withAlpha(40),
                          ),
                        ),
                        Text(
                          sound.title,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                'Music: ${sound.title}',
                style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppPalette.color1,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 20,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: sound.tags.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        sound.tags[index],
                        style: const TextStyle(
                          color: AppPalette.color1,
                          fontFamily: 'Raleway',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              icon: const Icon(
                Icons.visibility,
                color: AppPalette.colorWhite,
                size: 20,
              ),
              text: sound.views,
            ),
            CustomButton(
              onTap: onShare,
              icon: Transform.flip(
                flipX: true,
                child: const Icon(
                  Icons.reply,
                  color: AppPalette.colorWhite,
                  size: 20,
                ),
              ),
              text: 'Share',
            ),
            CustomButton(
              onTap: onDownload,
              icon: const Icon(
                Icons.download,
                color: AppPalette.colorWhite,
                size: 20,
              ),
              text: 'Download',
            ),
            CustomButton(
              onTap: onSave,
              icon: const Icon(
                Icons.bookmark,
                color: AppPalette.colorWhite,
                size: 20,
              ),
              text: 'Save',
            ),
          ],
        ),
      ],
    );
  }
}
