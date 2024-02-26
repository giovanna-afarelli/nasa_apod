import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomListItem extends StatelessWidget {
  final String? heroTag;
  final String? imageUrl;
  final String title;
  final String subTitle;

  const CustomListItem({
    super.key,
    this.heroTag,
    this.imageUrl,
    required this.title,
    required this.subTitle,
  });

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
          Builder(builder: (context) {
            const imageSize = 70.0;

            final image = Image.network(
              imageUrl ?? "",
              height: imageSize,
              width: imageSize,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const SizedBox(
                  height: imageSize,
                  width: imageSize,
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
                  height: imageSize,
                  width: imageSize,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: const Center(child: Text("X")),
                );
              },
            );
            if (heroTag != null) {
              return Hero(
                tag: heroTag!,
                child: image,
              );
            }
            return image;
          }),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.yellow.shade200,
                  ),
                ),
                Text(subTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
