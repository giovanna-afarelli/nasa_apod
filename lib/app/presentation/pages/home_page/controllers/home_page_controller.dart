import 'package:flutter/material.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_images_list_usecase.dart';
import 'package:nasa_apod/app/presentation/pages/details_page/details_page.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/stores/home_page_store.dart';
import 'package:nasa_apod/di.dart';
import 'package:nasa_apod/shared/utils/dartz_utils.dart';

class HomePageController {
  final HomePageStore pageStore;

  final getApodImagesListUsecase = Di.get<GetApodImagesListUsecase>();
  final searchController = TextEditingController();

  HomePageController({
    required this.pageStore,
  });

  void initialize() {
    _loadImagesList();

    searchController
        .addListener(() => _onChangeSearchTerm(searchController.text));
  }

  void _loadImagesList() async {
    pageStore.setIsLoadingImagesList(true);
    final listOrFailure = await getApodImagesListUsecase(
      GetApodImagesListUsecaseParams(
        startDate: "2024-02-01",
        endDate: "2024-02-15",
      ),
    );
    pageStore.setIsLoadingImagesList(false);

    if (listOrFailure.isLeft()) {
      pageStore.setHasErrorLoadingImagesList(true);
      return;
    }
    pageStore.setImagesList(listOrFailure.asRight());
  }

  void onTapImage(BuildContext context, Apod image) {
    Navigator.of(context).pushNamed(DetailsPage.routeName,
        arguments: DetailsPageArgs(
          apod: image,
        ));
  }

  void _onChangeSearchTerm(String text) {
    pageStore.setSearchTerm(text);
    final searchResult = pageStore.imagesList
        ?.where((image) =>
            (image.title?.contains(text) ?? false) ||
            (image.date?.contains(text) ?? false))
        .toList();

    pageStore.setSearchResult(searchResult);
  }
}
