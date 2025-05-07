import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picking_app/signin.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In Screen',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF000000),
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'SF Pro Display',
      ),
      home: const SignInScreen(),
    );
  }
}