import 'package:nasa_apod/app/domain/entities/apod.dart';

abstract class NasaDatasource {
  Future<List<Apod>> getImagesList({
    String? startDate,
    String? endDate,
  });
}
