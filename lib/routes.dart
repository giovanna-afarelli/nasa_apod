import 'package:flutter/material.dart';
import 'package:nasa_apod/app/presentation/pages/details_page/details_page.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/home_page.dart';
import 'package:nasa_apod/app/presentation/pages/not_found_page/not_found_page.dart';
import 'package:nasa_apod/app/presentation/pages/splash_screen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final page = _buildPage(
      name: settings.name ?? '',
      args: settings.arguments,
    );

    return MaterialPageRoute(
      settings: page != null
          ? settings
          : RouteSettings(name: '/404', arguments: settings.arguments),
      builder: (_) => page ?? const NotFoundPage(),
    );
  }

  static Widget? _buildPage({
    required String name,
    Object? args,
  }) {
    switch (name) {
      case SplashScreen.routeName:
        return const SplashScreen();
      case HomePage.routeName:
        return const HomePage();
      case DetailsPage.routeName:
        return const DetailsPage();
      default:
        return null;
    }
  }
}
