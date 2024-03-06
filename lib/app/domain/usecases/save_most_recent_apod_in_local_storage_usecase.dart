import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/shared/usecase.dart';

abstract class SaveMostRecentApodInLocalStorageUsecase extends FutureUseCase<
    bool, SaveMostRecentApodInLocalStorageUsecaseParams> {}

class SaveMostRecentApodInLocalStorageUsecaseParams {
  final Apod apod;

  SaveMostRecentApodInLocalStorageUsecaseParams({
    required this.apod,
  });
}
