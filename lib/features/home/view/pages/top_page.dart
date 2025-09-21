import 'package:flutter/material.dart';

import '../../../../core/dummy_db.dart';
import '../../../../core/theme/app_palette.dart';
import '../../model/quotes.dart';
import '../widgets/quotes_card.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Quotes'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  final quote = Quotes.fromMap(quotes[index]);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: QuotesCard(quote: quote),
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
