import 'package:appex_accounting/core/exceptions/exceptions.dart';
import 'package:appex_accounting/features/user_reegistration/data/sources/registration_data_source.dart';
import 'package:appex_accounting/features/user_reegistration/domain/entities/registered_user.dart';
import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/user_reegistration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationDataSourceImpl registrationDataSourceImpl;

  RegistrationRepositoryImpl(this.registrationDataSourceImpl);

  @override
  Future<Either<Failure, RegisteredUser>> registerUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  }) async {
    try {
      return Right(
        await registrationDataSourceImpl.registerUser(
          name: name,
          role: role,
          email: email,
          phone: phone,
          password: password,
          gender: gender,
        ),
      );
    } on SqlException {
      return Left(DatabaseFailure('T', ''));
    }
  }
}
