import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

class UploadPageWeb extends StatefulWidget {
  const UploadPageWeb({super.key});

  @override
  State<UploadPageWeb> createState() => _UploadPageWebState();
}

class _UploadPageWebState extends State<UploadPageWeb> {
  @override
  void initState() {
    const Dialog(
      child: Text('Hello'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Dialog(
          shadowColor: Colors.black87,
          backgroundColor: Colors.white,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.height / 1.1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Gap(5),
                      Text(
                        'Create a Post',
                        style: txtStyle(
                          32,
                          Colors.black,
                        ).copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: lightGrey,
                      ),
                      const Gap(5),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        CupertinoIcons.photo_fill_on_rectangle_fill,
                        size: MediaQuery.of(context).size.width / 6,
                      ),
                      const Gap(5),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        splashColor: Colors.white,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                            color: themeBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Select the file',
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: txtStyle(
                                  22,
                                  Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
