import 'package:fpdart/fpdart.dart';

import '../network/failure.dart';

abstract interface class Usecase<ReturnValue, Params> {
  Future<Either<Failure, ReturnValue>> execute({
    required Params params,
  });
}

abstract interface class NoParamUsecase<ReturnValue> {
  Future<Either<Failure, ReturnValue>> execute();
}
