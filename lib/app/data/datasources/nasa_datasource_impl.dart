import 'package:dio/dio.dart';
import 'package:nasa_apod/app/data/models/apod_model.dart';
import 'package:nasa_apod/app/domain/datasources/nasa_datasource.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/di.dart';
import 'package:nasa_apod/shared/constants.dart';

class NasaDatasourceImpl implements NasaDatasource {
  final dio = Di.get<Dio>();

  @override
  Future<List<Apod>> getImagesList({
    String? startDate,
    String? endDate,
  }) async {
    final queryParams = {
      "api_key": Constants.apiKey,
    };
    if (startDate != null && endDate != null) {
      queryParams.addAll(
        {
          "start_date": startDate,
          "end_date": endDate,
        },
      );
    }

    final response = await dio.get(
      '/planetary/apod',
      queryParameters: queryParams,
    );
    return (response.data as List)
        .map((apod) => ApodModel.fromMap(apod))
        .toList();
  }
}
