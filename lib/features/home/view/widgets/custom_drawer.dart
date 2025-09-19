import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  final bool showDrawer;
  final VoidCallback? onClose;
  final VoidCallback? onLogout;
  const CustomDrawer({
    super.key,
    required this.showDrawer,
    this.onClose,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      width: showDrawer ? 224 : 0,
      height: showDrawer ? null : 0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppPalette.color1,
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: showDrawer ? 1 : 0,
        child: Stack(
          children: [
            Positioned(
              top: 55,
              child: Image.asset(
                'assets/images/bird2.png',
                height: 95,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 68,
              right: 0,
              child: Image.asset(
                'assets/images/bird3.png',
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    right: 30,
                    bottom: 5,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: onClose,
                      child: const Icon(
                        Icons.clear,
                        color: AppPalette.color3Variant,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  child: Text(
                    '"Peace comes from within. Do not seek it without."',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppPalette.color3Variant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Buddha',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppPalette.color3Variant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 65),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: drawerMenu.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        bottom: 10,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 35,
                            child: SvgPicture.asset(
                              drawerMenu[index]['iconPath']!,
                              height: 24,
                              alignment: Alignment.centerLeft,
                              colorFilter: const ColorFilter.mode(
                                AppPalette.color3,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            drawerMenu[index]['title']!,
                            style: const TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: GestureDetector(
                    onTap: onLogout,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log Out',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.logout,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
