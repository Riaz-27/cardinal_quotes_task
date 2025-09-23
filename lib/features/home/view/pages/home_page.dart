import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:cardinal_quotes_task/features/auth/view/pages/login_page.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/soul_page.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/sound_page.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/top_page.dart';
import 'package:cardinal_quotes_task/features/home/view/widgets/custom_drawer.dart';
import 'package:cardinal_quotes_task/features/home/view/widgets/featured_card.dart';
import 'package:cardinal_quotes_task/features/home/view/widgets/featured_title.dart';
import 'package:cardinal_quotes_task/features/home/view/widgets/menu_card.dart';
import 'package:cardinal_quotes_task/features/home/view/widgets/top_menu_card.dart';
import 'package:cardinal_quotes_task/features/journals/views/pages/journal_page.dart';
import 'package:cardinal_quotes_task/features/saved/views/pages/saved_page.dart';
import 'package:cardinal_quotes_task/features/todo/views/pages/todo_page.dart';
import 'package:cardinal_quotes_task/features/wallpaper/views/pages/wallpaper_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showDrawer = false;

  @override
  Widget build(BuildContext context) {
    void menuNavigation(int index) {
      final soundIndexs = [0, 2, 3, 4, 5, 6, 7];
      soundIndexs.contains(index);
      if (soundIndexs.contains(index)) {
        Navigator.of(context).push(SoundPage.route(menus[index]['title']!));
      } else if (index == 1) {
        Navigator.of(context).push(WallpaperPage.route());
      } else if (index == 8 || index == 14 || index == 12) {
        Navigator.of(
          context,
        ).push(TopPage.route(appbarTitle: menus[index]['title']!));
      } else if (index == 9) {
        Navigator.of(context).push(SoulPage.route(showFeedback: true));
      } else if (index == 10) {
        Navigator.of(context).push(JournalPage.route());
      } else if (index == 11) {
        Navigator.of(context).push(TodoPage.route());
      } else if (index == 13) {
        Navigator.of(context).push(SavedPage.route());
      }
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: SizedBox(
                    height: 55,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showDrawer = !showDrawer;
                            });
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 30,
                            color: AppPalette.color1,
                          ),
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: topMenus.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: TopMenuCard(
                                  iconPath: topMenus[index]['iconPath']!,
                                  title: topMenus[index]['title']!,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 100 / 70,
                        ),
                    itemCount: menus.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => menuNavigation(index),
                        child: MenuCard(
                          iconPath: menus[index]['iconPath']!,
                          title: menus[index]['title']!,
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
                      child: FeaturedTitle(
                        title: 'Featured Wallpaper',
                        onTap: () {
                          Navigator.of(context).push(WallpaperPage.route());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 132,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredWallpaper.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 30 : 0,
                              right: 15,
                            ),
                            child: FeaturedCard(
                              imagePath: featuredWallpaper[index]['imagePath']!,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
                      child: FeaturedTitle(
                        title: 'Featured Quotes',
                        onTap: () {
                          Navigator.of(
                            context,
                          ).push(TopPage.route(appbarTitle: 'Top Quotes'));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 132,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredQuotes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 30 : 0,
                              right: 15,
                            ),
                            child: FeaturedCard(
                              imagePath: featuredQuotes[index]['imagePath']!,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
                      child: FeaturedTitle(
                        title: 'Featured Memorial Cards',
                        onTap: () {
                          Navigator.of(
                            context,
                          ).push(TopPage.route(appbarTitle: 'Memorial Cards'));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 132,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredMemorialCards.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 30 : 0,
                              right: 15,
                            ),
                            child: FeaturedCard(
                              imagePath:
                                  featuredMemorialCards[index]['imagePath']!,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 15),
                      child: FeaturedTitle(title: 'Announcement'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        bottom: 25,
                      ),
                      height: 132,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          announcement[0]['imagePath']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CustomDrawer(
              showDrawer: showDrawer,
              onClose: () {
                setState(() {
                  showDrawer = false;
                });
              },
              onLogout: () {
                Navigator.of(
                  context,
                ).pushAndRemoveUntil(
                  LoginPage.route(),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
