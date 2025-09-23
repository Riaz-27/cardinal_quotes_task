import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';

class CustomChipButton extends StatelessWidget {
  final String chipName;
  final String chipActiveIcon;
  final String chipInactiveIcon;
  final bool isActive;
  final VoidCallback? onTap;
  const CustomChipButton({
    super.key,
    required this.chipName,
    required this.chipActiveIcon,
    required this.chipInactiveIcon,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          border: isActive
              ? null
              : Border.all(color: AppPalette.color1, width: 0.5),
          borderRadius: BorderRadius.circular(15),
          color: isActive ? AppPalette.color1 : null,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              isActive ? chipActiveIcon : chipInactiveIcon,
              fit: BoxFit.cover,
              height: 24,
              colorFilter: ColorFilter.mode(
                isActive ? AppPalette.color3 : AppPalette.color1,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              chipName,
              style: AppTheme.textStyle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isActive ? AppPalette.color3 : AppPalette.color1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
