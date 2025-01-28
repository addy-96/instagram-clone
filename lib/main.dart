import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/auth/data/datasources/auth_remote_datasource.dart';
import 'package:insta_clone/auth/data/repositories/auth_repository_impl.dart';
import 'package:insta_clone/auth/domain/usecase/signUp_usecase.dart';
import 'package:insta_clone/auth/presentaion/bloc/auth_bloc.dart';
import 'package:insta_clone/auth/presentaion/pages/intro_login_screen.dart';
import 'package:insta_clone/dependencies.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRobWp6c3hicW9teGlkY3FoY3VkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc3NDA3NDIsImV4cCI6MjA1MzMxNjc0Mn0.bD_zzbPdJdfhAHTmBRrsW1Ulem_1G35tZQb8T_qPmAI",
      url: "https://dhmjzsxbqomxidcqhcud.supabase.co");

  await initDependicies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            signupUsecase: SignupUsecase(
              authRepository: AuthRepositoryImpl(
                authRemoteDatasource: AuthRemoteDatasourceImpl(
                  supabase: Supabase.instance,
                ),
              ),
            ),
          ),
        )
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
    return const IntroLoginScreen();
  }
}
