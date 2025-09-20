import 'package:flutter/material.dart';

import '../../../../core/dummy_db.dart';
import '../../model/quotes.dart';
import '../widgets/quotes_card.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Top Quotes'),
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
