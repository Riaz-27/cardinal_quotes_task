import 'package:cardinal_quotes_task/features/home/model/quotes.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';
import 'custom_button.dart';

class QuotesCard extends StatelessWidget {
  final Quotes quote;
  final VoidCallback? onShare;
  final VoidCallback? onDownload;
  final VoidCallback? onSave;

  const QuotesCard({
    super.key,
    required this.quote,
    this.onShare,
    this.onDownload,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (quote.quoteText != null && quote.quoteText!.trim() != '')
          Container(
            height: 227,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: quote.color,
            ),
            child: Center(
              child: Text(
                quote.quoteText!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        if (quote.imageUrl != null && quote.imageUrl!.trim() != '')
          SizedBox(
            height: 227,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                quote.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        const SizedBox(height: 5),
        SizedBox(
          height: 20,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: quote.tags.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  quote.tags[index],
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              icon: const Icon(
                Icons.visibility,
                color: AppPalette.colorWhite,
                size: 20,
              ),
              text: quote.views,
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
