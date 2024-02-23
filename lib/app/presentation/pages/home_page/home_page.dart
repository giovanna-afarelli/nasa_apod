import 'package:flutter/material.dart';
import 'package:nasa_apod/app/presentation/pages/details_page/details_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APOD"),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(DetailsPage.routeName),
          child: const Text("navegar"),
        ),
      ]),
    );
  }
}
