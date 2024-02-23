import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = "/details";

  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).maybePop(),
          child: const Text("Voltar"),
        ),
      ]),
    );
  }
}
