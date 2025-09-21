import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/home_page.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/sound_page.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'soul_page.dart';

class HomeNavPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const HomeNavPage());
  const HomeNavPage({super.key});

  @override
  State<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  int selectedIndex = 0;

  bool showNotificationPopup = false;
  bool isNotificationToggled = true;

  final pages = [
    const HomePage(),
    const SoundPage(appbarTitle: 'Sounds'),
    const SoulPage(),
    const TopPage(),
  ];

  Widget notificationPopup() => Positioned(
    bottom: 10,
    right: 30,
    child: AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: showNotificationPopup ? 1 : 0,
      child: !showNotificationPopup
          ? const SizedBox()
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              width: 156,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppPalette.color1,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showNotificationPopup = false;
                        });
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Notification',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.55,
                        child: Switch(
                          thumbColor: WidgetStateProperty.all(
                            AppPalette.color1,
                          ),
                          activeTrackColor: AppPalette.color3,
                          inactiveTrackColor: AppPalette.color3.withAlpha(50),
                          value: isNotificationToggled,
                          onChanged: (value) {
                            setState(() {
                              isNotificationToggled = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[selectedIndex],
          notificationPopup(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          color: AppPalette.color1,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconSize: 24,
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppPalette.color3,
              ),
              selectedItemColor: AppPalette.color3,
              unselectedItemColor: AppPalette.color3,
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppPalette.color3,
              ),
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              onTap: (index) => {
                if (index == 4)
                  {
                    setState(() {
                      showNotificationPopup = !showNotificationPopup;
                    }),
                  }
                else
                  {
                    setState(() {
                      selectedIndex = index;
                    }),
                  },
              },
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/nav_icons/home_active.svg',
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/nav_icons/home_inactive.svg',
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/nav_icons/sounds_active.svg',
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/nav_icons/sounds_inactive.svg',
                  ),
                  label: 'Sounds',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/nav_icons/soul_active.svg',
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/nav_icons/soul_inactive.svg',
                  ),
                  label: 'Soul',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/nav_icons/top_active.svg',
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/nav_icons/top_inactive.svg',
                  ),
                  label: 'Top',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/icons/nav_icons/more_active.svg',
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/nav_icons/more_active.svg',
                  ),
                  label: 'More',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
