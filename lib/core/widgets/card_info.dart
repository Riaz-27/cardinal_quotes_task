import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

class CardInfo extends StatelessWidget {
  final String? soundTitle;
  final List<String> tags;
  const CardInfo({
    super.key,
    this.soundTitle,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (soundTitle != null)
          Text(
            'Music: $soundTitle',
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppPalette.color1,
            ),
          ),
        if (soundTitle != null) const SizedBox(height: 5),
        SizedBox(
          height: 20,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tags.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  tags[index],
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
    );
  }
}
