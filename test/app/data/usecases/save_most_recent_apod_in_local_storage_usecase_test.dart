import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_apod/app/data/usecases/save_most_recent_apod_in_local_storage_usecase_impl.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/usecases/save_most_recent_apod_in_local_storage_usecase.dart';
import 'package:nasa_apod/shared/errors/local_storage_failure.dart';
import 'package:nasa_apod/shared/services/local_storage_service.dart';
import 'package:nasa_apod/shared/utils/dartz_utils.dart';
import 'package:test/test.dart';

import 'save_most_recent_apod_in_local_storage_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LocalStorageService>()])
void main() {
  late MockLocalStorageService mockStorageService;
  late SaveMostRecentApodInLocalStorageUsecase
      saveMostRecentApodInLocalStorageUsecase;

  setUp(() {
    mockStorageService = MockLocalStorageService();

    final getIt = GetIt.instance;
    getIt.registerLazySingleton<SaveMostRecentApodInLocalStorageUsecase>(
      () => SaveMostRecentApodInLocalStorageUsecaseImpl(mockStorageService),
    );

    saveMostRecentApodInLocalStorageUsecase =
        getIt.get<SaveMostRecentApodInLocalStorageUsecase>();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('Save apod in Local Storage', () {
    test('Save apod', () async {
      when(mockStorageService.setString(
              LocalStorageKeys.mostRecentApodTitle, "test"))
          .thenAnswer(
        (_) async => true,
      );
      when(mockStorageService.setString(
              LocalStorageKeys.mostRecentApodDate, "test"))
          .thenAnswer(
        (_) async => true,
      );
      when(mockStorageService.setString(
              LocalStorageKeys.mostRecentApodExplanation, "test"))
          .thenAnswer(
        (_) async => true,
      );
      when(mockStorageService.setString(
              LocalStorageKeys.mostRecentApodUrl, "test"))
          .thenAnswer(
        (_) async => true,
      );

      final result = await saveMostRecentApodInLocalStorageUsecase(
        SaveMostRecentApodInLocalStorageUsecaseParams(
          apod: Apod(
            title: "test",
            date: "test",
            explanation: "test",
            url: "test",
          ),
        ),
      );

      verify(saveMostRecentApodInLocalStorageUsecase(
        SaveMostRecentApodInLocalStorageUsecaseParams(
          apod: Apod(
            title: "test",
            date: "test",
            explanation: "test",
            url: "test",
          ),
        ),
      )).called(1);
      expect(
        result,
        isA<Right>(),
      );
      expect(
        result.asRight(),
        isA<bool>(),
      );
    });

    test(
        'When there is a error saving any of the attributes, return LocalStorageFailure',
        () async {
      when(mockStorageService.setString(
              LocalStorageKeys.mostRecentApodTitle, "test"))
          .thenAnswer(
        (_) async => false,
      );

      final result = await saveMostRecentApodInLocalStorageUsecase(
        SaveMostRecentApodInLocalStorageUsecaseParams(
          apod: Apod(
            title: "test",
            date: "test",
            explanation: "test",
            url: "test",
          ),
        ),
      );

      verify(saveMostRecentApodInLocalStorageUsecase(
        SaveMostRecentApodInLocalStorageUsecaseParams(
          apod: Apod(
            title: "test",
            date: "test",
            explanation: "test",
            url: "test",
          ),
        ),
      )).called(1);
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
