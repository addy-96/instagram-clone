import 'package:flutter/material.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

void csnack(BuildContext context, String message, Color? color) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: txtStyle(
            18,
            Colors.white,
          ),
        ),
        backgroundColor: color ?? themeBlue,
      ),
    );
}
