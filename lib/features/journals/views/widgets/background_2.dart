import 'package:flutter/cupertino.dart';

class Background2 extends StatelessWidget {
  const Background2({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: SizedBox(
            height: 324,
            width: deviceSize.width,
            child: Image.asset(
              'assets/images/journal_bgs/bg2_top.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              opacity: const AlwaysStoppedAnimation(0.29),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: deviceSize.height - 350,
          child: SizedBox(
            height: 193,
            width: 193,
            child: Image.asset(
              'assets/images/journal_bgs/bg2_bottom.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              opacity: const AlwaysStoppedAnimation(0.2),
            ),
          ),
        ),
      ],
    );
  }
}
