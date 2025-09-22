import 'package:cardinal_quotes_task/core/constants/utils.dart';
import 'package:cardinal_quotes_task/features/journals/model/journal.dart';
import 'package:flutter/material.dart';

class JournalCard extends StatelessWidget {
  final Journal journal;
  const JournalCard({super.key, required this.journal});

  @override
  Widget build(BuildContext context) {
    final textColor = hexToRgb(journal.textColor);
    final backgroundColor = hexToRgb(journal.backgroundColor);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              journal.title,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            SizedBox(height: 5),
            Text(
              journal.note,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              ".........",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
