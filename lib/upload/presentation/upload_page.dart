import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.clear_thick,
                      size: 35,
                    ),
                    const Gap(20),
                    Text(
                      'New Post',
                      style: txtStyle(
                        25,
                        Colors.black,
                      ).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Next',
                  style: txtStyle(
                    18,
                    themeBlue,
                  ).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(color: Colors.green),
          )
        ],
      ),
    );
  }
}
