import 'package:flutter/material.dart';
import 'package:insta_clone/auth/presentaion/pages/login_screen.dart';
import 'package:insta_clone/auth/presentaion/pages/sign_up_screen.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

class DontHaveAnAccountButton extends StatelessWidget {
  DontHaveAnAccountButton({
    super.key,
    required this.signColor,
    required this.isLoginScreen,
  });

  final Color signColor;
  bool isLoginScreen;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginScreen
              ? 'Don\'t have an account? '
              : 'Already have an accont? ',
          style: txtStyle(15, lightGrey).copyWith(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    isLoginScreen ? const SignUpScreen() : const LoginScreen(),
              ),
            );
          },
          child: Text(
            isLoginScreen ? 'Sign up.' : 'Log in.',
            style:
                txtStyle(15, signColor).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
