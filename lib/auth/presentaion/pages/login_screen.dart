import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone/auth/presentaion/widgets/dont_have_an_account_button.dart';
import 'package:insta_clone/auth/presentaion/widgets/input_field.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 28,
            opticalSize: 0.1,
            fill: 0.1,
            weight: 0.1,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                color: Colors.black.withOpacity(0.9),
                scale: 18,
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Column(
                  children: [
                    InputField(
                      inputHintText: 'Username',
                      textEditingController: usernameController,
                  
                    ),
                    const Gap(15),
                    InputField(
                      inputHintText: 'Password',
                      textEditingController: passwordController,
                 
                    ),
                    const Gap(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: txtStyle(15, Colors.blue).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 17, 148, 255),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'Log in',
                          style: txtStyle(
                            18,
                            Colors.white,
                          ).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.facebook_sharp,
                            color: Colors.blue,
                          ),
                          const Gap(8),
                          Text(
                            'Log in with Facebook',
                            style: txtStyle(18, Colors.blue).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.blueGrey.withOpacity(0.2),
                          ),
                        ),
                        const Gap(35),
                        const Text('OR'),
                        const Gap(35),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.blueGrey.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                    DontHaveAnAccountButton(
                      signColor: const Color.fromARGB(255, 25, 144, 240),
                      isLoginScreen: true,
                    ),
                    const Gap(100)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
