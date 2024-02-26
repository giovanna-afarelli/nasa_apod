import 'package:nasa_apod/shared/errors/failure.dart';

class ApiFailure extends Failure {
  final String message;

  ApiFailure(this.message);

  @override
  List<Object?> get props => [message];
}
