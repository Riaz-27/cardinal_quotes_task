import 'package:cardinal_quotes_task/core/widgets/card_action_menu.dart';
import 'package:cardinal_quotes_task/core/widgets/card_info.dart';
import 'package:cardinal_quotes_task/features/home/model/quotes.dart';
import 'package:flutter/material.dart';

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
        CardInfo(tags: quote.tags),
        CardActionMenu(
          views: quote.views,
          onDownload: onDownload,
          onSave: onSave,
          onShare: onShare,
        ),
      ],
    );
  }
}
