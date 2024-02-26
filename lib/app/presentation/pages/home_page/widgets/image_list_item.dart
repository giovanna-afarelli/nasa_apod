import 'package:flutter/material.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/shared/widgets/custom_list_item.dart';

class ImageListItem extends StatelessWidget {
  const ImageListItem({
    super.key,
    required this.image,
  });

  final Apod image;

  @override
  Widget build(BuildContext context) {
    return CustomListItem(
      heroTag: "apod_image_${image.title}",
      imageUrl: image.url,
      title: image.title ?? "",
      subTitle: image.date ?? "",
    );
  }
}
