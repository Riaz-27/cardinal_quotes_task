import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: AppPalette.colorWhite,
            ),
          ),
        ],
      ),
    );
  }
}
