import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/auth/presentaion/bloc/auth_bloc.dart';
import 'package:insta_clone/auth/presentaion/pages/intro_login_screen.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';
import 'package:insta_clone/dependencies.dart';
import 'package:insta_clone/upload/presentation/bloc/upload_bloc.dart';
import 'package:insta_clone/wrapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRobWp6c3hicW9teGlkY3FoY3VkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc3NDA3NDIsImV4cCI6MjA1MzMxNjc0Mn0.bD_zzbPdJdfhAHTmBRrsW1Ulem_1G35tZQb8T_qPmAI",
    url: "https://dhmjzsxbqomxidcqhcud.supabase.co",
  );

  await initDependecies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            loginUsecase: serviceLocator(),
            signupUsecase: serviceLocator(),
          ),
        ),
        BlocProvider(
          create: (context) => UploadBloc(
            loadAlbumsUsecase: serviceLocator(),
            loadAssetUsecase: serviceLocator(),
          ),
        ),
      ],
      child: const MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          final authState = snapshot.data;

          if (authState == null) {
            return Center(
              child: Column(
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    'Trying to connect to internet.......',
                    style: txtStyle(15, themeBlue),
                  )
                ],
              ),
            );
          } else {
            final session = authState.session;

            if (session != null) {
              return const Wrapper();
            }
            return const IntroLoginScreen();
          }
        },
      ),
    );
  }
}
