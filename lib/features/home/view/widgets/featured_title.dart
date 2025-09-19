import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class FeaturedTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const FeaturedTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppPalette.color1,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Row(
            children: [
              Text(
                'See All',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppPalette.color1,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: AppPalette.color1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
