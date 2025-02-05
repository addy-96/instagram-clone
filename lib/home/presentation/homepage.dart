import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/home/presentation/widgets/post.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          CupertinoIcons.camera,
          color: Colors.black.withOpacity(0.8),
          weight: 100,
          size: 35,
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fill,
          scale: 10,
          height: 80,
          width: 150,
        ),
        actions: [
          Icon(
            CupertinoIcons.play_rectangle,
            color: Colors.black.withOpacity(0.8),
            size: 35,
            weight: 100,
          ),
          const Gap(15),
          Icon(
            CupertinoIcons.paperplane,
            color: Colors.black.withOpacity(0.8),
            size: 35,
          ),
          const Gap(15),
        ],
        forceMaterialTransparency: true,
        elevation: 10,
        shadowColor: Colors.black,
        shape: Border(
          bottom: BorderSide(
            color: lightGrey.withOpacity(0.4),
            width: 1.8,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i <= 30; i++)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                      ),
                    )
                ],
              ),
            ),
            const Gap(10),
            const Post(),
            const Gap(10),
            const Post(),
            const Gap(10),
            const Post(),
          ],
        ),
      ),
    );
  }
}
