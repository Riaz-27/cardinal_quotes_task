import 'package:flutter/cupertino.dart';

class Background6 extends StatelessWidget {
  const Background6({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Positioned(
      bottom: 75,
      left: ((deviceSize.width - 323.0) / 2.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 323,
          width: 323,
          child: Image.asset(
            'assets/images/journal_bgs/bg6.png',
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            opacity: const AlwaysStoppedAnimation(0.21),
          ),
        ),
      ),
    );
  }
}
