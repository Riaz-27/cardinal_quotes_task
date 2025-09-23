import 'package:flutter/cupertino.dart';

class Background3 extends StatelessWidget {
  const Background3({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 317,
        width: 314,
        child: Image.asset(
          'assets/images/journal_bgs/bg3.png',
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          opacity: const AlwaysStoppedAnimation(0.2),
        ),
      ),
    );
  }
}
