import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/user_reegistration/domain/entities/registered_user.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, RegisteredUser>> registerUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  });
}
