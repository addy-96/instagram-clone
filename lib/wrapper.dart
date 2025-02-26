import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';
import 'package:insta_clone/home/presentation/homepage.dart';
import 'package:insta_clone/test.dart';
import 'package:insta_clone/upload/presentation/upload_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 768) {
      return Scaffold(
        bottomNavigationBar: PersistentTabView(
          backgroundColor: Colors.black,
          tabs: [
            PersistentTabConfig(
              screen: Homepage(
                  userId: Supabase.instance.client.auth.currentUser!.id),
              item: ItemConfig(
                icon: const Icon(
                  CupertinoIcons.home,
                ),
              ),
            ),
            PersistentTabConfig(
              screen: const Test(),
              item: ItemConfig(
                icon: const Icon(
                  CupertinoIcons.compass,
                ),
              ),
            ),
            PersistentTabConfig(
              screen: const UploadPage(),
              item: ItemConfig(
                icon: const Icon(Icons.add_circle_outline_outlined),
              ),
            ),
            PersistentTabConfig(
              screen: const Test(),
              item: ItemConfig(
                icon: const Icon(
                  CupertinoIcons.heart,
                ),
              ),
            ),
            PersistentTabConfig(
              screen: const Test(),
              item: ItemConfig(
                  icon: const CircleAvatar(
                radius: 20,
              )),
            ),
          ],
          navBarBuilder: (p0) => Style5BottomNavBar(navBarConfig: p0),
        ),
      );
    } else {
      return const Scaffold(
          body: Row(
        children: [
          BigNavBar(),
        ],
      ));
    }
  }
}

class BigNavBar extends StatefulWidget {
  const BigNavBar({super.key});

  @override
  State<BigNavBar> createState() => _BigNavBarState();
}

class _BigNavBarState extends State<BigNavBar> {
  final bigNotSelectedTextstyle = txtStyle(25, Colors.black54);
  final bigSelectedTextstyle =
      txtStyle(25, Colors.black).copyWith(fontWeight: FontWeight.bold);

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const changeWidth = 1595;
    log(MediaQuery.of(context).size.width.toString());
    return Container(
      width: MediaQuery.of(context).size.width / 7,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1.5,
            color: lightGrey,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            splashColor: Colors.white38,
            selected: selectedIndex == 0,
            selectedColor: Colors.black,
            title: Row(
              mainAxisAlignment: width > changeWidth
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(
                  selectedIndex == 0 ? Icons.home_filled : CupertinoIcons.home,
                  size: 40,
                ),
                const Gap(10),
                width > changeWidth
                    ? Text('Home',
                        style: selectedIndex == 0
                            ? bigSelectedTextstyle
                            : bigNotSelectedTextstyle)
                    : Container(),
              ],
            ),
          ),
          const Gap(10),
          ListTile(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            splashColor: Colors.white38,
            selected: selectedIndex == 1,
            selectedColor: Colors.black,
            title: Row(
              mainAxisAlignment: width > changeWidth
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(
                  selectedIndex == 1
                      ? CupertinoIcons.search_circle_fill
                      : CupertinoIcons.search,
                  size: 40,
                ),
                const Gap(10),
                width > changeWidth
                    ? Text('Search',
                        style: selectedIndex == 1
                            ? bigSelectedTextstyle
                            : bigNotSelectedTextstyle)
                    : Container(),
              ],
            ),
          ),
          const Gap(10),
          ListTile(
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            splashColor: Colors.white38,
            selected: selectedIndex == 2,
            selectedColor: Colors.black,
            title: Row(
              mainAxisAlignment: width > changeWidth
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(
                  selectedIndex == 2
                      ? CupertinoIcons.mail_solid
                      : CupertinoIcons.mail,
                  size: 40,
                ),
                const Gap(10),
                width > changeWidth
                    ? Text('Message',
                        style: selectedIndex == 2
                            ? bigSelectedTextstyle
                            : bigNotSelectedTextstyle)
                    : Container(),
              ],
            ),
          ),
          const Gap(10),
          ListTile(
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
            },
            splashColor: Colors.white38,
            selected: selectedIndex == 3,
            selectedColor: Colors.black,
            title: Row(
              mainAxisAlignment: width > changeWidth
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(
                  selectedIndex == 3
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  size: 40,
                ),
                const Gap(10),
                width > changeWidth
                    ? Text('Notifiaction',
                        style: selectedIndex == 3
                            ? bigSelectedTextstyle
                            : bigNotSelectedTextstyle)
                    : Container(),
              ],
            ),
          ),
          const Gap(10),
          ListTile(
            onTap: () {
              setState(() {
                selectedIndex = 4;
              });
            },
            splashColor: Colors.white38,
            selected: selectedIndex == 4,
            selectedColor: Colors.black,
            title: Row(
              mainAxisAlignment: width > changeWidth
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(
                  selectedIndex == 4
                      ? CupertinoIcons.add_circled_solid
                      : CupertinoIcons.add_circled,
                  size: 40,
                ),
                const Gap(10),
                width > changeWidth
                    ? Text(
                        'Create',
                        style: selectedIndex == 5
                            ? bigSelectedTextstyle
                            : bigNotSelectedTextstyle,
                      )
                    : Container(),
              ],
            ),
          ),
          const Spacer(),
          ListTile(
            title: Row(
              mainAxisAlignment: width > changeWidth
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                ),
                const Gap(10),
                width > changeWidth
                    ? Text('Profile', style: bigNotSelectedTextstyle)
                    : Container(),
              ],
            ),
          ),
          const Gap(20)
        ],
      ),
    );
  }
}





/* Scaffold(
        body: Row(
          children: <Widget>[
            IntrinsicWidth(
              child: NavigationRail(
                elevation: 3,
                extended: true,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    print(index);
                    _selectedIndex = index;
                  });
                },
                trailing: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const CircleAvatar(),
                        title: Text(
                          'Profile',
                          style: txtStyle(16, Colors.black87).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Gap(10),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Log Out',
                          style: txtStyle(
                            15,
                            themeBlue,
                          ),
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 25,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                    width: 140,
                  ),
                ),
                labelType: NavigationRailLabelType.none,
                destinations: <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: const Icon(Icons.home_outlined),
                    selectedIcon: const Icon(Icons.home),
                    label: _selectedIndex == 0
                        ? Text(
                            'Home',
                            style: txtStyle(18, Colors.black87)
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'Home',
                            style: txtStyle(
                              15,
                              Colors.black87,
                            ),
                          ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(CupertinoIcons.compass),
                    selectedIcon: const Icon(CupertinoIcons.compass_fill),
                    label: _selectedIndex == 1
                        ? Text(
                            'Explore',
                            style: txtStyle(18, Colors.black87)
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'Explore',
                            style: txtStyle(
                              15,
                              Colors.black87,
                            ),
                          ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(CupertinoIcons.add_circled),
                    selectedIcon: const Icon(CupertinoIcons.add_circled_solid),
                    label: _selectedIndex == 2
                        ? Text(
                            'Create',
                            style: txtStyle(18, Colors.black87)
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'Create',
                            style: txtStyle(
                              15,
                              Colors.black87,
                            ),
                          ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(CupertinoIcons.heart),
                    selectedIcon: const Icon(CupertinoIcons.heart_fill),
                    label: _selectedIndex == 3
                        ? Text(
                            'Notification',
                            style: txtStyle(18, Colors.black87)
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'Notification',
                            style: txtStyle(
                              15,
                              Colors.black87,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(thickness: 0, width: 0),
            if (_selectedIndex == 0)
              Homepage(userId: Supabase.instance.client.auth.currentUser!.id),
            if (_selectedIndex == 2) const Dialog(),
/*             Expanded(
              child: Center(
                child: Container(
                  height: double.infinity,
                  width: 500,
                  decoration: const BoxDecoration(),
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        Post(),
                        Gap(20),
                        Post(),
                        Gap(20),
                        Post(),
                        Gap(20),
                      ],
                    ),
                  ),
                ),
              ),
            ) */
          ],
        ),
      ); */