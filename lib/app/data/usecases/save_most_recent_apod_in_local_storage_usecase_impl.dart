import 'package:dartz/dartz.dart';
import 'package:nasa_apod/app/domain/usecases/save_most_recent_apod_in_local_storage_usecase.dart';
import 'package:nasa_apod/shared/errors/failure.dart';
import 'package:nasa_apod/shared/errors/local_storage_failure.dart';
import 'package:nasa_apod/shared/services/local_storage_service.dart';

class SaveMostRecentApodInLocalStorageUsecaseImpl
    implements SaveMostRecentApodInLocalStorageUsecase {
  final LocalStorageService localStorageService;

  SaveMostRecentApodInLocalStorageUsecaseImpl(this.localStorageService);

  @override
  Future<Either<Failure, bool>> call(
      SaveMostRecentApodInLocalStorageUsecaseParams params) async {
    final titleResult = await localStorageService.setString(
      LocalStorageKeys.mostRecentApodTitle,
      params.apod.title ?? "",
    );
    final urlResult = await localStorageService.setString(
      LocalStorageKeys.mostRecentApodUrl,
      params.apod.url ?? "",
    );
    final explanationResult = await localStorageService.setString(
      LocalStorageKeys.mostRecentApodExplanation,
      params.apod.explanation ?? "",
    );
    final dateResult = await localStorageService.setString(
      LocalStorageKeys.mostRecentApodDate,
      params.apod.date ?? "",
    );

    final result = titleResult && urlResult && explanationResult && dateResult;

    if (result) {
      return Right(result);
    }

    return Left(LocalStorageFailure());
  }
}
