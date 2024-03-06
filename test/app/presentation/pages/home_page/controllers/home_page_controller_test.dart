import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart' as Mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_from_local_storage_usecase.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_images_list_usecase.dart';
import 'package:nasa_apod/app/domain/usecases/save_most_recent_apod_in_local_storage_usecase.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/controllers/home_page_controller.dart';
import 'package:nasa_apod/app/presentation/pages/home_page/stores/home_page_store.dart';
import 'package:test/test.dart';

import 'home_page_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HomePageStore>(),
  MockSpec<GetApodImagesListUsecase>(),
  MockSpec<SaveMostRecentApodInLocalStorageUsecase>(),
  MockSpec<GetApodFromLocalStorageUsecase>(),
])
void main() {
  late MockHomePageStore mockHomePageStore;
  late MockGetApodImagesListUsecase mockGetApodImagesListUsecase;
  late MockSaveMostRecentApodInLocalStorageUsecase
      mockSaveMostRecentApodInLocalStorageUsecase;
  late MockGetApodFromLocalStorageUsecase mockGetApodFromLocalStorageUsecase;

  late HomePageController homePageController;

  setUp(() {
    mockHomePageStore = MockHomePageStore();
    mockGetApodImagesListUsecase = MockGetApodImagesListUsecase();
    mockSaveMostRecentApodInLocalStorageUsecase =
        MockSaveMostRecentApodInLocalStorageUsecase();
    mockGetApodFromLocalStorageUsecase = MockGetApodFromLocalStorageUsecase();

    final getIt = GetIt.instance;
    getIt.registerLazySingleton<HomePageController>(
      () => HomePageController(
        mockHomePageStore,
        mockGetApodImagesListUsecase,
        mockSaveMostRecentApodInLocalStorageUsecase,
        mockGetApodFromLocalStorageUsecase,
      ),
    );

    homePageController = getIt.get<HomePageController>();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('Initializing', () {
    test('When initializing, should load image list', () async {
      when(mockGetApodImagesListUsecase(GetApodImagesListUsecaseParams()))
          .thenAnswer(
        (_) async => Right(
          [
            Apod(title: "test"),
            Apod(title: "test"),
          ],
        ),
      );

      when(mockHomePageStore.imagesList).thenAnswer(
        (_) => Mobx.ObservableList.of(
          [
            Apod(title: "test"),
            Apod(title: "test"),
          ],
        ),
      );

      expect(
        mockHomePageStore.imagesList,
        isA<List<Apod>>(),
      );
      expect(
        mockHomePageStore.imagesList,
        isNotEmpty,
      );
    });
  });
}
