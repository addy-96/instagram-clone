
import 'package:fpdart/fpdart.dart';
import 'package:insta_clone/core/errors/failure.dart';

abstract interface class UsecaseInterface<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params param);
}
