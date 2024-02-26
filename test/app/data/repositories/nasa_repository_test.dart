import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_apod/app/data/repositories/nasa_repository_impl.dart';
import 'package:nasa_apod/app/domain/datasources/nasa_datasource.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/repositories/nasa_repository.dart';
import 'package:nasa_apod/shared/errors/api_failure.dart';
import 'package:nasa_apod/shared/utils/dartz_utils.dart';
import 'package:test/test.dart';

import 'nasa_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NasaDatasource>()])
void main() {
  late NasaRepository nasaRepository;
  late MockNasaDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockNasaDatasource();

    final getIt = GetIt.instance;
    getIt.registerSingleton<MockNasaDatasource>(mockDatasource);

    getIt.registerLazySingleton<NasaRepository>(
      () => NasaRepositoryImpl(mockDatasource),
    );

    nasaRepository = getIt.get<NasaRepository>();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('Get image list', () {
    test('Load images list', () async {
      const startDate = "2024-02-01";
      const endDate = "2024-02-15";

      when(mockDatasource.getImagesList(
        startDate: startDate,
        endDate: endDate,
      )).thenAnswer(
        (_) async => [
          Apod(title: "Teste"),
          Apod(title: "Teste2"),
        ],
      );

      final result = await nasaRepository.getImagesList(
        startDate: startDate,
        endDate: endDate,
      );

      verify(mockDatasource.getImagesList(
        startDate: startDate,
        endDate: endDate,
      )).called(1);
      expect(
        result,
        isA<Right>(),
      );
      expect(
        result.asRight(),
        isA<List<Apod>>(),
      );
    });

    test('Load todays image', () async {
      when(mockDatasource.getImagesList()).thenAnswer(
        (_) async => [
          Apod(title: "Teste"),
        ],
      );

      final result = await nasaRepository.getImagesList();

      verify(mockDatasource.getImagesList()).called(1);
      expect(
        result,
        isA<Right>(),
      );
      expect(
        result.asRight(),
        isA<List<Apod>>(),
      );
    });

    test('When datasource throws a exception, returns an ApiFailure', () async {
      when(mockDatasource.getImagesList()).thenThrow(Exception());

      final result = await nasaRepository.getImagesList();

      verify(mockDatasource.getImagesList()).called(1);
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
