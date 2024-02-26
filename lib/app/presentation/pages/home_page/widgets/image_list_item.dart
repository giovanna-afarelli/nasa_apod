import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';

class ImageListItem extends StatelessWidget {
  const ImageListItem({
    super.key,
    required this.image,
  });

  final Apod image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Row(
        children: [
          Image.network(
            image.url ?? "",
            height: 70,
            width: 70,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const SizedBox(
                height: 70,
                width: 70,
                child: Center(
                    child: SizedBox(
                  height: 20,
                  width: 20,
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
                height: 70,
                width: 70,
                decoration: const BoxDecoration(color: Colors.grey),
                child: const Center(child: Text("X")),
              );
            },
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  image.title ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.yellow.shade200,
                  ),
                ),
                Text(image.date ?? ""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
