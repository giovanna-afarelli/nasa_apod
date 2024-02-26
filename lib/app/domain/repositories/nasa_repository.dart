import 'package:dartz/dartz.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/shared/errors/failure.dart';

abstract class NasaRepository {
  Future<Either<Failure, List<Apod>>> getImagesList({
    String? startDate,
    String? endDate,
  });
}
