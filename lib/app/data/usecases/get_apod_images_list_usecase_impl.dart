import 'package:dartz/dartz.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/repositories/nasa_repository.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_images_list_usecase.dart';
import 'package:nasa_apod/di.dart';
import 'package:nasa_apod/shared/errors/failure.dart';

class GetApodImagesListUsecaseImpl implements GetApodImagesListUsecase {
  final nasaRepository = Di.get<NasaRepository>();

  @override
  Future<Either<Failure, List<Apod>>> call(
      GetApodImagesListUsecaseParams params) {
    return nasaRepository.getImagesList(
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }
}
