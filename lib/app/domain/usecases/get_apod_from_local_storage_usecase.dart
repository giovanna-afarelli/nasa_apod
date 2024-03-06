import 'package:nasa_apod/app/domain/entities/apod.dart';
import 'package:nasa_apod/shared/usecase.dart';

abstract class GetApodFromLocalStorageUsecase
    extends FutureUseCase<Apod, NoParams> {}
