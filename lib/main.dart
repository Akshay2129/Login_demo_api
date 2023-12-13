import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_api/cubit/cubit/user_details_cubit.dart';
import 'package:login_demo_api/screens/LoginScreen.dart';
import 'package:login_demo_api/screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        // useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<UserDetailsCubit>(
            create: (context) => UserDetailsCubit(),
          ),
        ],
        child: UserScreen(),
      ),
    );
  }
}
