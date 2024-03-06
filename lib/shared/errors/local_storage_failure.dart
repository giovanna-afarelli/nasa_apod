import 'package:nasa_apod/shared/errors/failure.dart';

class LocalStorageFailure extends Failure {
  final String? message;

  LocalStorageFailure([this.message]);

  @override
  List<Object?> get props => [message];
}
