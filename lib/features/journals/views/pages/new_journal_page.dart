import 'dart:math';

import 'package:cardinal_quotes_task/features/journals/views/widgets/background_1.dart';
import 'package:cardinal_quotes_task/features/journals/views/widgets/background_2.dart';
import 'package:cardinal_quotes_task/features/journals/views/widgets/background_3.dart';
import 'package:cardinal_quotes_task/features/journals/views/widgets/background_4.dart';
import 'package:cardinal_quotes_task/features/journals/views/widgets/background_5.dart';
import 'package:cardinal_quotes_task/features/journals/views/widgets/background_6.dart';
import 'package:cardinal_quotes_task/features/journals/views/widgets/journal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_palette.dart';

class NewJournalPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const NewJournalPage());
  const NewJournalPage({super.key});

  @override
  State<NewJournalPage> createState() => _NewJournalPageState();
}

class _NewJournalPageState extends State<NewJournalPage> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  final backgrounds = [
    const Background1(),
    const Background2(),
    const Background3(),
    const Background4(),
    const Background5(),
    const Background6(),
  ];
  final backgroundColor = [AppPalette.colorWhite, AppPalette.color1];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = selectedBackgroudIndex();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  int selectedBackgroudIndex() {
    return Random().nextInt(backgrounds.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedIndex == 0
          ? backgroundColor[0]
          : backgroundColor[1],
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 20),
      //     child: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: const Icon(
      //         Icons.arrow_forward_rounded,
      //         size: 26,
      //         color: AppPalette.color3,
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       padding: const EdgeInsets.only(right: 30),
      //       onPressed: () {},
      //       icon: Container(
      //         height: 30,
      //         width: 30,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(5),
      //           color: AppPalette.color3,
      //         ),
      //         child: const Icon(
      //           Icons.menu,
      //           size: 22,
      //           color: AppPalette.color1,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            backgrounds[selectedIndex],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          size: 26,
                          color: AppPalette.color3,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppPalette.color3,
                          ),
                          child: const Icon(
                            Icons.menu,
                            size: 22,
                            color: AppPalette.color1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  JournalTextField(
                    controller: titleController,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    hintText: 'Title',
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: JournalTextField(
                        controller: noteController,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        hintText: 'Note',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppPalette.color3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 35,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/journals_icons/camera.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/journals_icons/edit.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/journals_icons/broken_link.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/journals_icons/menu.svg',
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 35),
                      child: Text(
                        'Edited 11 May 2025  11:41PM',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppPalette.color1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
