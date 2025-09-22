import 'package:flutter/cupertino.dart';

class Background1 extends StatelessWidget {
  const Background1({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Positioned(
      bottom: 100,
      child: SizedBox(
        height: 291,
        width: deviceSize.width,
        child: Image.asset(
          'assets/images/journal_bgs/bg1.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          opacity: const AlwaysStoppedAnimation(0.3),
        ),
      ),
    );
  }
}
