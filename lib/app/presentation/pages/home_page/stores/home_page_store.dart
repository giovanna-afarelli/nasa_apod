import 'package:mobx/mobx.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStoreBase with _$HomePageStore;

abstract class _HomePageStoreBase with Store {
  @observable
  List<Apod>? imagesList;

  @action
  void setImagesList(List<Apod> list) {
    imagesList = list;
  }

  @observable
  bool isLoadingImagesList = false;

  @action
  void setIsLoadingImagesList(bool value) {
    isLoadingImagesList = value;
  }

  @observable
  bool hasErrorLoadingImagesList = false;

  @action
  void setHasErrorLoadingImagesList(bool value) {
    hasErrorLoadingImagesList = value;
  }
}
