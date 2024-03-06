import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_apod/app/data/usecases/get_apod_from_local_storage_usecase_impl.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_from_local_storage_usecase.dart';
import 'package:nasa_apod/shared/errors/local_storage_failure.dart';
import 'package:nasa_apod/shared/services/local_storage_service.dart';
import 'package:nasa_apod/shared/usecase.dart';
import 'package:nasa_apod/shared/utils/dartz_utils.dart';
import 'package:test/test.dart';

import 'get_apod_from_local_storage_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LocalStorageService>()])
void main() {
  late MockLocalStorageService mockStorageService;
  late GetApodFromLocalStorageUsecase getApodFromLocalStorageUsecase;

  setUp(() {
    mockStorageService = MockLocalStorageService();

    final getIt = GetIt.instance;
    getIt.registerLazySingleton<GetApodFromLocalStorageUsecase>(
      () => GetApodFromLocalStorageUsecaseImpl(mockStorageService),
    );

    getApodFromLocalStorageUsecase =
        getIt.get<GetApodFromLocalStorageUsecase>();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('Get Apod from Local Storage', () {
    test('Load apod', () async {
      when(mockStorageService.getString(LocalStorageKeys.mostRecentApodTitle))
          .thenAnswer(
        (_) async => "Test",
      );
      when(mockStorageService.getString(LocalStorageKeys.mostRecentApodDate))
          .thenAnswer(
        (_) async => "Test",
      );
      when(mockStorageService
              .getString(LocalStorageKeys.mostRecentApodExplanation))
          .thenAnswer(
        (_) async => "Test",
      );
      when(mockStorageService.getString(LocalStorageKeys.mostRecentApodUrl))
          .thenAnswer(
        (_) async => "Test",
      );

      final result = await getApodFromLocalStorageUsecase(const NoParams());

      verify(getApodFromLocalStorageUsecase(const NoParams())).called(1);
      expect(
        result,
        isA<Right>(),
      );
      expect(
        result.asRight(),
        isA<Apod>(),
      );
    });

    test('When there is no image in local storage, return LocalStorageFailure',
        () async {
      when(mockStorageService.getString(LocalStorageKeys.mostRecentApodTitle))
          .thenAnswer(
        (_) async => null,
      );

      final result = await getApodFromLocalStorageUsecase(const NoParams());

      verify(getApodFromLocalStorageUsecase(const NoParams())).called(1);
      expect(
        result,
        isA<Left>(),
      );
      expect(
        result.asLeft(),
        isA<LocalStorageFailure>(),
      );
    });
  });
}
