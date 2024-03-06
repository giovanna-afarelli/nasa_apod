import 'package:flutter/material.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_from_local_storage_usecase.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_images_list_usecase.dart';
import 'package:nasa_apod/app/domain/usecases/save_most_recent_apod_in_local_storage_usecase.dart';
import 'package:nasa_apod/app/presentation/pages/details_page/details_page.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/stores/home_page_store.dart';
import 'package:nasa_apod/shared/usecase.dart';
import 'package:nasa_apod/shared/utils/dartz_utils.dart';
import 'package:nasa_apod/shared/utils/datetime_utils.dart';

class HomePageController {
  final HomePageStore pageStore;
  final GetApodImagesListUsecase getApodImagesListUsecase;
  final SaveMostRecentApodInLocalStorageUsecase
      saveMostRecentApodInLocalStorageUsecase;
  final GetApodFromLocalStorageUsecase getApodFromLocalStorageUsecase;

  final searchController = TextEditingController();

  HomePageController(
    this.pageStore,
    this.getApodImagesListUsecase,
    this.saveMostRecentApodInLocalStorageUsecase,
    this.getApodFromLocalStorageUsecase,
  );

  void initialize() {
    pageStore.resetStore();
    _loadImagesList();

    searchController
        .addListener(() => _onChangeSearchTerm(searchController.text));
  }

  void _loadImagesList() async {
    pageStore.setIsLoadingMoreImages(true);

    final listOrFailure = await getApodImagesListUsecase(
      GetApodImagesListUsecaseParams(
        startDate: DateTimeUtils.getNasaFormattedTime(pageStore.startDate),
        endDate: DateTimeUtils.getNasaFormattedTime(pageStore.endDate),
      ),
    );

    pageStore.setIsLoadingMoreImages(false);

    if (listOrFailure.isLeft()) {
      pageStore.setHasErrorLoadingMoreImages(true);
      return;
    }
    pageStore.setImagesList(listOrFailure.asRight().reversed.toList());

    if (pageStore.page == 0) {
      _saveMostRecentPictureInLocalStorage();
    }
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
        .where((image) =>
            (image.title?.contains(text) ?? false) ||
            (image.date?.contains(text) ?? false))
        .toList();

    pageStore.setSearchResult(searchResult);
  }

  void loadMoreImages() {
    if (!pageStore.isLoadingMoreImages) {
      pageStore.setPage(pageStore.page + 1);
      _loadImagesList();
    }
  }

  void onTapTryLoadingAgain() {
    _loadImagesList();
  }

  void _saveMostRecentPictureInLocalStorage() async {
    await saveMostRecentApodInLocalStorageUsecase(
      SaveMostRecentApodInLocalStorageUsecaseParams(
          apod: pageStore.imagesList.first),
    );
  }

  void onTapSeeMostRecentLocalApod(BuildContext context) async {
    final apodOrFailure =
        await getApodFromLocalStorageUsecase(const NoParams());

    if (apodOrFailure.isLeft()) {
      return;
    }

    final apod = apodOrFailure.asRight();

    if (context.mounted) {
      Navigator.of(context).pushNamed(
        DetailsPage.routeName,
        arguments: DetailsPageArgs(
          apod: Apod(
            title: apod.title,
            url: apod.url,
            explanation: apod.explanation,
            date: apod.date,
          ),
        ),
      );
    }
  }
}
