import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/controllers/home_page_controller.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/stores/home_page_store.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/widgets/image_list_item.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageStore = HomePageStore();
  late final pageController = HomePageController(pageStore: pageStore);

  @override
  void initState() {
    pageController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Astronomy Picture of the Day"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Observer(builder: (context) {
          if (pageStore.isLoadingImagesList) {
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: [
                    Colors.blue,
                  ],
                ),
              ),
            );
          }
          if (pageStore.hasErrorLoadingImagesList) {
            return const Center(
              child: Text("Ocorreu um erro"),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 12,
              );
            },
            itemCount: pageStore.imagesList?.length ?? 0,
            itemBuilder: (ctx, index) {
              if (pageStore.imagesList?[index] == null) {
                return const SizedBox.shrink();
              }
              return InkWell(
                onTap: () => pageController.onTapImage(
                    context, pageStore.imagesList![index]),
                child: ImageListItem(
                  image: pageStore.imagesList![index],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
