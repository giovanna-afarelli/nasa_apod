// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStoreBase, Store {
  late final _$imagesListAtom =
      Atom(name: '_HomePageStoreBase.imagesList', context: context);

  @override
  List<Apod>? get imagesList {
    _$imagesListAtom.reportRead();
    return super.imagesList;
  }

  @override
  set imagesList(List<Apod>? value) {
    _$imagesListAtom.reportWrite(value, super.imagesList, () {
      super.imagesList = value;
    });
  }

  late final _$isLoadingImagesListAtom =
      Atom(name: '_HomePageStoreBase.isLoadingImagesList', context: context);

  @override
  bool get isLoadingImagesList {
    _$isLoadingImagesListAtom.reportRead();
    return super.isLoadingImagesList;
  }

  @override
  set isLoadingImagesList(bool value) {
    _$isLoadingImagesListAtom.reportWrite(value, super.isLoadingImagesList, () {
      super.isLoadingImagesList = value;
    });
  }

  late final _$hasErrorLoadingImagesListAtom = Atom(
      name: '_HomePageStoreBase.hasErrorLoadingImagesList', context: context);

  @override
  bool get hasErrorLoadingImagesList {
    _$hasErrorLoadingImagesListAtom.reportRead();
    return super.hasErrorLoadingImagesList;
  }

  @override
  set hasErrorLoadingImagesList(bool value) {
    _$hasErrorLoadingImagesListAtom
        .reportWrite(value, super.hasErrorLoadingImagesList, () {
      super.hasErrorLoadingImagesList = value;
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
  void setIsLoadingImagesList(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setIsLoadingImagesList');
    try {
      return super.setIsLoadingImagesList(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasErrorLoadingImagesList(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setHasErrorLoadingImagesList');
    try {
      return super.setHasErrorLoadingImagesList(value);
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
  String toString() {
    return '''
imagesList: ${imagesList},
isLoadingImagesList: ${isLoadingImagesList},
hasErrorLoadingImagesList: ${hasErrorLoadingImagesList},
searchTerm: ${searchTerm},
searchResult: ${searchResult}
    ''';
  }
}
