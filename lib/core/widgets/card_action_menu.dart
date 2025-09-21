import 'package:flutter/material.dart';

import '../theme/app_palette.dart';
import 'custom_button.dart';

class CardActionMenu extends StatelessWidget {
  final bool isSaved;
  final String views;
  final Color? color;
  final VoidCallback? onShare;
  final VoidCallback? onDownload;
  final VoidCallback? onSave;

  const CardActionMenu({
    super.key,
    this.isSaved = false,
    required this.views,
    this.color,
    this.onShare,
    this.onDownload,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? (isSaved ? AppPalette.color5 : AppPalette.colorgg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                icon: const Icon(
                  Icons.visibility,
                  color: AppPalette.colorWhite,
                  size: 20,
                ),
                text: views,
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
                text: isSaved ? 'Remove' : 'Save',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
