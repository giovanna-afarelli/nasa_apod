import 'package:dartz/dartz.dart';
import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_from_local_storage_usecase.dart';
import 'package:nasa_apod/shared/errors/failure.dart';
import 'package:nasa_apod/shared/errors/local_storage_failure.dart';
import 'package:nasa_apod/shared/services/local_storage_service.dart';
import 'package:nasa_apod/shared/usecase.dart';

class GetApodFromLocalStorageUsecaseImpl
    implements GetApodFromLocalStorageUsecase {
  final LocalStorageService localStorageService;

  GetApodFromLocalStorageUsecaseImpl(this.localStorageService);

  @override
  Future<Either<Failure, Apod>> call(NoParams params) async {
    final title = await localStorageService
        .getString(LocalStorageKeys.mostRecentApodTitle);
    final url =
        await localStorageService.getString(LocalStorageKeys.mostRecentApodUrl);
    final explanation = await localStorageService
        .getString(LocalStorageKeys.mostRecentApodExplanation);
    final date = await localStorageService
        .getString(LocalStorageKeys.mostRecentApodDate);

    final result = (title != null) && (url != null);

    if (result) {
      return Right(
        Apod(
          title: title,
          url: url,
          explanation: explanation,
          date: date,
        ),
      );
    }

    return Left(LocalStorageFailure());
  }
}
