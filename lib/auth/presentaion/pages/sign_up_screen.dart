import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone/auth/presentaion/bloc/auth_bloc.dart';
import 'package:insta_clone/auth/presentaion/widgets/dont_have_an_account_button.dart';
import 'package:insta_clone/auth/presentaion/widgets/input_field.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/csnack.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';
import 'package:insta_clone/home/presentation/homepage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool validateInput() {
    if (usernameController.text.trim().isEmpty) {
      csnack(context, 'Please enter a Username', null);
      return false;
    }
    if (usernameController.text.trim().length < 8) {
      csnack(context, 'Username must be atleast 8 characters long!', null);
      return false;
    }
    if (emailController.text.trim().isEmpty) {
      csnack(context, 'Can not proceed with empty email!', null);
      return false;
    }
    if (!emailController.text.contains('@')) {
      csnack(context, 'Something wrong with your email address! 😂', null);
      return false;
    }
    if (passwordController.text.trim().isEmpty) {
      csnack(context, 'Wooh! Why is the password empty', null);
      return false;
    }
    if (passwordController.text.length <= 8) {
      csnack(context, 'Guess what? The password is short! try a longer one.',
          null);
      return false;
    }
    return true;
  }

  void onSignUp() {
    if (validateInput()) {
      final String username = usernameController.text.trim();
      final String email = emailController.text.trim();
      final String pass = passwordController.text.trim();

      context.read<AuthBloc>().add(
            UserSignUpRequestedEvent(
              username: username,
              email: email,
              password: pass,
            ),
          );
    }
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            return csnack(context, state.errorMessage, Colors.red);
          }

          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => Homepage(
                  userId: state.userID,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: themeBlue,
              ),
            );
          }
          return SingleChildScrollView(
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
                          inputHintText: 'Email',
                          textEditingController: emailController,
                        ),
                        /* const Gap(15),
                          const InputField(
                            inputHintText: 'Phone Number',
                          ), */
                        const Gap(15),
                        InputField(
                          inputHintText: 'Password',
                          textEditingController: passwordController,
                        ),
                        const Gap(18),
                        /*  Row(
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
                          ), */
                        const Gap(20),
                        InkWell(
                          enableFeedback: true,
                          splashColor: Colors.white,
                          hoverColor: Colors.green,
                          onTap: () {
                            onSignUp();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 12,
                            width: MediaQuery.of(context).size.width / 1,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 17, 148, 255),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: txtStyle(
                                  18,
                                  Colors.white,
                                ).copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                        /* GestureDetector(
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
                          const Gap(30), */
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
                          isLoginScreen: false,
                        ),
                        const Gap(100)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
