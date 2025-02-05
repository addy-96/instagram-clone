import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/home/presentation/homepage.dart';
import 'package:insta_clone/test.dart';
import 'package:insta_clone/upload/presentation/upload_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        backgroundColor: Colors.black,
        tabs: [
          PersistentTabConfig(
            screen:
                Homepage(userId: Supabase.instance.client.auth.currentUser!.id),
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
  }
}
