import 'package:flutter/material.dart';
import 'package:nasa_apod/app/presentation/pages/splash_screen/splash_screen.dart';
import 'package:nasa_apod/di.dart';
import 'package:nasa_apod/routes.dart';

void main() async {
  await Di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA APOD',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
