import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:nasa_apod/app/data/datasources/nasa_datasource_impl.dart';
import 'package:nasa_apod/app/domain/datasources/nasa_datasource.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/shared/constants.dart';
import 'package:test/test.dart';

void main() {
  late NasaDatasource nasaDatasource;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: Constants.nasaBaseApiUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ));
    dioAdapter = DioAdapter(dio: dio);

    final getIt = GetIt.instance;
    getIt.registerLazySingleton<NasaDatasource>(
      () => NasaDatasourceImpl(dio),
    );
    nasaDatasource = getIt.get<NasaDatasource>();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('Get image list', () {
    test('Should return list of apod when code is 200', () async {
      const startDate = "2024-02-01";
      const endDate = "2024-02-15";

      dioAdapter.onGet(
          "/planetary/apod",
          (server) => server.reply(
                200,
                {"title": "Teste"},
              ),
          queryParameters: {
            "api_key": Constants.apiKey,
          });

      final result = await nasaDatasource.getImagesList(
        startDate: startDate,
        endDate: endDate,
      );

      expect(
        result,
        isA<List<Apod>>(),
      );
    });

    test('Should return error when code is 401', () async {
      dioAdapter.onGet(
          "/planetary/apod",
          (server) => server.throws(
                401,
                DioException(
                    requestOptions: RequestOptions(path: "/planetary/apod")),
              ),
          queryParameters: {
            "api_key": Constants.apiKey,
          });

      expect(
        () async => await nasaDatasource.getImagesList(),
        throwsA(isA<DioException>()),
      );
    });
  });
}
