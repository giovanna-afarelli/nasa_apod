import 'package:dartz/dartz.dart';
import 'package:nasa_apod/shared/errors/failure.dart';

abstract class FutureUseCase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call(Params params);
}

abstract class UseCase<ReturnType, Params> {
  Either<Failure, ReturnType> call(Params params);
}

class NoParams {
  const NoParams();
}
