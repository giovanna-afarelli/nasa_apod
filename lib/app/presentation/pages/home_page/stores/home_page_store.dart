import 'package:mobx/mobx.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/shared/constants.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStoreBase with _$HomePageStore;

abstract class _HomePageStoreBase with Store {
  @observable
  ObservableList<Apod> imagesList = ObservableList.of([]);

  @action
  void setImagesList(List<Apod> list) {
    imagesList.addAll(list);
  }

  @observable
  bool isLoadingMoreImages = false;

  @action
  void setIsLoadingMoreImages(bool value) {
    isLoadingMoreImages = value;
  }

  @observable
  bool hasErrorLoadingMoreImages = false;

  @action
  void setHasErrorLoadingMoreImages(bool value) {
    hasErrorLoadingMoreImages = value;
  }

  @observable
  String? searchTerm;

  @action
  void setSearchTerm(String value) {
    searchTerm = value;
  }

  @observable
  List<Apod>? searchResult;

  @action
  void setSearchResult(List<Apod>? list) {
    searchResult = list;
  }

  @observable
  int page = 0;

  @action
  void setPage(int value) {
    page = value;
  }

  @computed
  DateTime get endDate => DateTime.now()
      .subtract(Duration(days: page * (Constants.daysToFetchPictures + 1)));

  @computed
  DateTime get startDate => endDate.subtract(
        const Duration(days: Constants.daysToFetchPictures),
      );
}
