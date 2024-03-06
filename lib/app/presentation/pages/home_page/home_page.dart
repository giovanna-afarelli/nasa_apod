import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/controllers/home_page_controller.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/stores/home_page_store.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/widgets/image_list_item.dart';
import 'package:nasa_apod/di.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageStore = Di.get<HomePageStore>();
  final pageController = Di.get<HomePageController>();

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
          if (pageStore.isLoadingMoreImages && pageStore.imagesList.isEmpty) {
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
          if (pageStore.hasErrorLoadingMoreImages &&
              pageStore.imagesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Ocorreu um erro ao carregar a lista"),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () => pageController.onTapTryLoadingAgain(),
                    child: const Text("Tentar novamente"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        pageController.onTapSeeMostRecentLocalApod(context),
                    child: const Text("Ver última imagem salva"),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: pageController.searchController,
                decoration: const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification &&
                      notification.metrics.extentAfter == 0) {
                    pageController.loadMoreImages();
                  }
                  return false;
                },
                child: Expanded(
                  child: Observer(builder: (context) {
                    if (pageStore.searchTerm?.isNotEmpty ?? false) {
                      if (pageStore.searchResult == null) {
                        return const SizedBox.shrink();
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (ctx, index) {
                          return const SizedBox(
                            height: 12,
                          );
                        },
                        itemCount: pageStore.searchResult!.length,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () => pageController.onTapImage(
                                context, pageStore.searchResult![index]),
                            child: ImageListItem(
                              image: pageStore.searchResult![index],
                            ),
                          );
                        },
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: pageStore.imagesList.length + 1,
                      itemBuilder: (ctx, index) {
                        if (index < pageStore.imagesList.length) {
                          return InkWell(
                            onTap: () => pageController.onTapImage(
                                context, pageStore.imagesList[index]),
                            child: ImageListItem(
                              image: pageStore.imagesList[index],
                            ),
                          );
                        }
                        return const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballPulse,
                              colors: [
                                Colors.blue,
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
