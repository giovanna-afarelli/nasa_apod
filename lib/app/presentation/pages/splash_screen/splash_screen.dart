import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      Navigator.of(context).pushNamed(HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("assets/dart_bird.png"),
        ),
      ),
    );
  }
}
