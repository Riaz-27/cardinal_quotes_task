import 'package:flutter/cupertino.dart';

class Background4 extends StatelessWidget {
  const Background4({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Positioned(
      bottom: 15,
      left: -34,
      child: SizedBox(
        height: 545,
        width: deviceSize.width + 34,
        child: Image.asset(
          'assets/images/journal_bgs/bg4.png',
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          opacity: const AlwaysStoppedAnimation(0.29),
        ),
      ),
    );
  }
}
