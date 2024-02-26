import 'package:flutter/material.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/widgets/image_list_item.dart';

class ImageList extends StatelessWidget {
  const ImageList({
    super.key,
    required this.list,
    required this.onTapItem,
  });

  final List<Apod>? list;
  final Function(int) onTapItem;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 12,
        );
      },
      itemCount: list?.length ?? 0,
      itemBuilder: (ctx, index) {
        if (list?[index] == null) {
          return const SizedBox.shrink();
        }
        return InkWell(
          onTap: () => onTapItem(index),
          child: ImageListItem(
            image: list![index],
          ),
        );
      },
    );
  }
}
