import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class JournalTextField extends StatelessWidget {
  final TextEditingController controller;
  final FontWeight fontWeight;
  final double fontSize;
  final String hintText;
  const JournalTextField({
    super.key,
    required this.fontWeight,
    required this.fontSize,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isNote = hintText.toLowerCase() == 'note';
    return TextField(
      controller: controller,
      style: TextStyle(
        fontFamily: 'Raleway',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: AppPalette.color3,
      ),
      maxLines: isNote ? null : 1,
      expands: isNote ? true : false,
      textAlign: TextAlign.justify,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hint: Text(
          hintText,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: AppPalette.color3,
          ),
        ),
      ),
    );
  }
}
