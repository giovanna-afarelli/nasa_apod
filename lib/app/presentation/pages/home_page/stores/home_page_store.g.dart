// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStoreBase, Store {
  Computed<DateTime>? _$endDateComputed;

  @override
  DateTime get endDate =>
      (_$endDateComputed ??= Computed<DateTime>(() => super.endDate,
              name: '_HomePageStoreBase.endDate'))
          .value;
  Computed<DateTime>? _$startDateComputed;

  @override
  DateTime get startDate =>
      (_$startDateComputed ??= Computed<DateTime>(() => super.startDate,
              name: '_HomePageStoreBase.startDate'))
          .value;

  late final _$imagesListAtom =
      Atom(name: '_HomePageStoreBase.imagesList', context: context);

  @override
  ObservableList<Apod> get imagesList {
    _$imagesListAtom.reportRead();
    return super.imagesList;
  }

  @override
  set imagesList(ObservableList<Apod> value) {
    _$imagesListAtom.reportWrite(value, super.imagesList, () {
      super.imagesList = value;
    });
  }

  late final _$isLoadingMoreImagesAtom =
      Atom(name: '_HomePageStoreBase.isLoadingMoreImages', context: context);

  @override
  bool get isLoadingMoreImages {
    _$isLoadingMoreImagesAtom.reportRead();
    return super.isLoadingMoreImages;
  }

  @override
  set isLoadingMoreImages(bool value) {
    _$isLoadingMoreImagesAtom.reportWrite(value, super.isLoadingMoreImages, () {
      super.isLoadingMoreImages = value;
    });
  }

  late final _$hasErrorLoadingMoreImagesAtom = Atom(
      name: '_HomePageStoreBase.hasErrorLoadingMoreImages', context: context);

  @override
  bool get hasErrorLoadingMoreImages {
    _$hasErrorLoadingMoreImagesAtom.reportRead();
    return super.hasErrorLoadingMoreImages;
  }

  @override
  set hasErrorLoadingMoreImages(bool value) {
    _$hasErrorLoadingMoreImagesAtom
        .reportWrite(value, super.hasErrorLoadingMoreImages, () {
      super.hasErrorLoadingMoreImages = value;
    });
  }

  late final _$searchTermAtom =
      Atom(name: '_HomePageStoreBase.searchTerm', context: context);

  @override
  String? get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String? value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  late final _$searchResultAtom =
      Atom(name: '_HomePageStoreBase.searchResult', context: context);

  @override
  List<Apod>? get searchResult {
    _$searchResultAtom.reportRead();
    return super.searchResult;
  }

  @override
  set searchResult(List<Apod>? value) {
    _$searchResultAtom.reportWrite(value, super.searchResult, () {
      super.searchResult = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_HomePageStoreBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$_HomePageStoreBaseActionController =
      ActionController(name: '_HomePageStoreBase', context: context);

  @override
  void setImagesList(List<Apod> list) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setImagesList');
    try {
      return super.setImagesList(list);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoadingMoreImages(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setIsLoadingMoreImages');
    try {
      return super.setIsLoadingMoreImages(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasErrorLoadingMoreImages(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setHasErrorLoadingMoreImages');
    try {
      return super.setHasErrorLoadingMoreImages(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchTerm(String value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setSearchTerm');
    try {
      return super.setSearchTerm(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchResult(List<Apod>? list) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setSearchResult');
    try {
      return super.setSearchResult(list);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(int value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imagesList: ${imagesList},
isLoadingMoreImages: ${isLoadingMoreImages},
hasErrorLoadingMoreImages: ${hasErrorLoadingMoreImages},
searchTerm: ${searchTerm},
searchResult: ${searchResult},
page: ${page},
endDate: ${endDate},
startDate: ${startDate}
    ''';
  }
}
