import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/shared/usecase.dart';

abstract class GetApodImagesListUsecase
    extends FutureUseCase<List<Apod>, GetApodImagesListUsecaseParams> {}

class GetApodImagesListUsecaseParams {
  final String? startDate;
  final String? endDate;

  GetApodImagesListUsecaseParams({
    this.startDate,
    this.endDate,
  });
}
