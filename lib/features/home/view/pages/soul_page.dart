import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/features/home/model/quotes.dart';
import 'package:cardinal_quotes_task/features/home/view/widgets/quotes_card.dart';
import 'package:flutter/material.dart';

class SoulPage extends StatelessWidget {
  const SoulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Soul Check-In'),
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
