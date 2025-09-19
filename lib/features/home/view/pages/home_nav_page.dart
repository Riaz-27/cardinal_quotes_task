import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeNavPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const HomeNavPage());
  const HomeNavPage({super.key});

  @override
  State<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  int selectedIndex = 0;

  final pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
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
                setState(() {
                  selectedIndex = index;
                }),
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
