import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_apod/app/data/usecases/get_apod_images_list_usecase_impl.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/repositories/nasa_repository.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_images_list_usecase.dart';
import 'package:nasa_apod/shared/errors/api_failure.dart';
import 'package:nasa_apod/shared/utils/dartz_utils.dart';
import 'package:test/test.dart';

import 'get_apod_images_list_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NasaRepository>()])
void main() {
  late MockNasaRepository mockNasaRepository;
  late GetApodImagesListUsecase getApodImagesListUsecase;

  setUp(() {
    mockNasaRepository = MockNasaRepository();

    final getIt = GetIt.instance;
    getIt.registerLazySingleton<GetApodImagesListUsecase>(
      () => GetApodImagesListUsecaseImpl(mockNasaRepository),
    );

    getApodImagesListUsecase = getIt.get<GetApodImagesListUsecase>();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('Get images list', () {
    test('When there are no date parameters, return images list', () async {
      when(mockNasaRepository.getImagesList()).thenAnswer(
        (_) async => Right(
          [
            Apod(title: "Teste"),
            Apod(title: "Teste2"),
          ],
        ),
      );

      final result =
          await getApodImagesListUsecase(GetApodImagesListUsecaseParams());

      verify(getApodImagesListUsecase(GetApodImagesListUsecaseParams()))
          .called(1);
      expect(
        result,
        isA<Right>(),
      );
      expect(
        result.asRight(),
        isA<List<Apod>>(),
      );
    });

    test('When there are date parameters, return images list', () async {
      const startDate = "2024-02-01";
      const endDate = "2024-02-15";

      when(mockNasaRepository.getImagesList(
        startDate: startDate,
        endDate: endDate,
      )).thenAnswer(
        (_) async => Right(
          [
            Apod(title: "Teste"),
            Apod(title: "Teste2"),
          ],
        ),
      );

      final result =
          await getApodImagesListUsecase(GetApodImagesListUsecaseParams(
        startDate: startDate,
        endDate: endDate,
      ));

      verify(getApodImagesListUsecase(GetApodImagesListUsecaseParams(
        startDate: startDate,
        endDate: endDate,
      ))).called(1);
      expect(
        result,
        isA<Right>(),
      );
      expect(
        result.asRight(),
        isA<List<Apod>>(),
      );
    });

    test('When the repository returns Left(), the usecase should Left()',
        () async {
      when(mockNasaRepository.getImagesList()).thenAnswer(
        (_) async => Left(
          ApiFailure(''),
        ),
      );

      final result =
          await getApodImagesListUsecase(GetApodImagesListUsecaseParams());

      verify(getApodImagesListUsecase(GetApodImagesListUsecaseParams()))
          .called(1);
      expect(
        result,
        isA<Left>(),
      );
      expect(
        result.asLeft(),
        isA<ApiFailure>(),
      );
    });
  });
}
