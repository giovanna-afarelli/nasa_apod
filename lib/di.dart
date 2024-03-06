import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_apod/app/data/datasources/nasa_datasource_impl.dart';
import 'package:nasa_apod/app/data/repositories/nasa_repository_impl.dart';
import 'package:nasa_apod/app/data/usecases/get_apod_from_local_storage_usecase_impl.dart';
import 'package:nasa_apod/app/data/usecases/get_apod_images_list_usecase_impl.dart';
import 'package:nasa_apod/app/data/usecases/save_most_recent_apod_in_local_storage_usecase_impl.dart';
import 'package:nasa_apod/app/domain/datasources/nasa_datasource.dart';
import 'package:nasa_apod/app/domain/repositories/nasa_repository.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_from_local_storage_usecase.dart';
import 'package:nasa_apod/app/domain/usecases/get_apod_images_list_usecase.dart';
import 'package:nasa_apod/app/domain/usecases/save_most_recent_apod_in_local_storage_usecase.dart';
import 'package:nasa_apod/shared/constants.dart';
import 'package:nasa_apod/shared/services/local_storage_service.dart';

class Di {
  static Future<void> setup() async {
    final getIt = GetIt.instance;
    // External
    getIt.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: Constants.nasaBaseApiUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ),
      ),
    );

    // SERVICES
    getIt.registerLazySingleton<LocalStorageService>(
      () => LocalStorageServiceImpl(),
    );

    // DATASOURCES
    getIt.registerLazySingleton<NasaDatasource>(
      () => NasaDatasourceImpl(getIt.get()),
    );

    // REPOSITORIES
    getIt.registerLazySingleton<NasaRepository>(
      () => NasaRepositoryImpl(getIt.get()),
    );

    // USECASES
    getIt.registerLazySingleton<GetApodImagesListUsecase>(
      () => GetApodImagesListUsecaseImpl(),
    );
    getIt.registerLazySingleton<SaveMostRecentApodInLocalStorageUsecase>(
      () => SaveMostRecentApodInLocalStorageUsecaseImpl(),
    );
    getIt.registerLazySingleton<GetApodFromLocalStorageUsecase>(
      () => GetApodFromLocalStorageUsecaseImpl(),
    );
  }

  static T get<T extends Object>({
    dynamic param1,
    dynamic param2,
    String? name,
  }) =>
      GetIt.instance.get<T>(
        param1: param1,
        param2: param2,
        instanceName: name,
      );
}
