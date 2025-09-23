import 'package:flutter/material.dart';

class Background5 extends StatelessWidget {
  const Background5({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 355,
        width: 355,
        child: Image.asset(
          'assets/images/journal_bgs/bg5.png',
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          opacity: const AlwaysStoppedAnimation(0.26),
        ),
      ),
    );
  }
}
