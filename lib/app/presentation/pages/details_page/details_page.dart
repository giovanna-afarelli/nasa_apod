import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';

class DetailsPageArgs {
  final Apod apod;

  DetailsPageArgs({
    required this.apod,
  });
}

class DetailsPage extends StatelessWidget {
  static const routeName = "/details";

  final DetailsPageArgs args;
  const DetailsPage({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.apod.title ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Hero(
              tag: "apod_image_${args.apod.title}",
              child: Image.network(
                args.apod.url ?? "",
                height: 200,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                        child: SizedBox(
                      height: 40,
                      width: 40,
                      child: LoadingIndicator(
                        indicatorType: Indicator.orbit,
                        colors: [
                          Colors.blue,
                        ],
                      ),
                    )),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: const Center(
                      child: Text("X"),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(args.apod.date ?? ""),
            const SizedBox(
              height: 24,
            ),
            Text(args.apod.explanation ?? ""),
          ],
        ),
      ),
    );
  }
}
