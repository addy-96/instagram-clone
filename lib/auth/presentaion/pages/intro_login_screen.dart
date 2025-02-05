import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone/auth/presentaion/pages/login_screen.dart';
import 'package:insta_clone/auth/presentaion/widgets/dont_have_an_account_button.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

class IntroLoginScreen extends StatelessWidget {
  const IntroLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Keep content centered
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      color: Colors.black.withOpacity(0.9),
                      scale: 18,
                    ),
                  ),
                  const Gap(10),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    enableFeedback: true,
                    splashColor: Colors.white,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 11,
                      width: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width / 5
                          : MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'Log in',
                          style: txtStyle(
                            22,
                            Colors.white,
                          ).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
          Divider(
            color: lightGrey.withOpacity(0.5),
            thickness: 0.5,
          ),
          const Gap(10),
          DontHaveAnAccountButton(
            signColor: Colors.black.withOpacity(0.7),
            isLoginScreen: true,
          ),
          const Gap(40)
        ],
      ),
    );
  }
}
