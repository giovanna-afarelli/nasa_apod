import 'package:dartz/dartz.dart';
import 'package:nasa_apod/app/domain/datasources/nasa_datasource.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/repositories/nasa_repository.dart';
import 'package:nasa_apod/shared/errors/api_failure.dart';
import 'package:nasa_apod/shared/errors/failure.dart';

class NasaRepositoryImpl implements NasaRepository {
  final NasaDatasource nasaDatasource;

  NasaRepositoryImpl(this.nasaDatasource);

  @override
  Future<Either<Failure, List<Apod>>> getImagesList({
    String? startDate,
    String? endDate,
  }) async {
    try {
      return Right(await nasaDatasource.getImagesList(
        startDate: startDate,
        endDate: endDate,
      ));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
