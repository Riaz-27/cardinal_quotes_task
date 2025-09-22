import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/features/journals/model/journal.dart';
import 'package:cardinal_quotes_task/features/journals/views/pages/new_journal_page.dart';
import 'package:cardinal_quotes_task/features/journals/views/widgets/journal_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class JournalPage extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const JournalPage());

  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sacred Journals'),
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
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {},
            icon: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppPalette.color1,
              ),
              child: const Icon(
                CupertinoIcons.search,
                size: 22,
                color: AppPalette.color3,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        margin: const EdgeInsets.only(right: 15, bottom: 30),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(NewJournalPage.route());
          },
          backgroundColor: AppPalette.color1,
          foregroundColor: AppPalette.color3,
          splashColor: AppPalette.color3.withAlpha(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10000),
          ),
          child: const Icon(
            Icons.add_to_photos,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: journals.length,
            itemBuilder: (context, index) {
              final journal = Journal.fromMap(journals[index]);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: JournalCard(journal: journal),
              );
            },
          ),
        ),
      ),
    );
  }
}
