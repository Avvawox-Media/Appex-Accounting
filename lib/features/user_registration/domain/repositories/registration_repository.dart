import '../../../../core/failure/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, int>> registerUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  });

  Future<Either<Failure, bool>> updateUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  });
}
