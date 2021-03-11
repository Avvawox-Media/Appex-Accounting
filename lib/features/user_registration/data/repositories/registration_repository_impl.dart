import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/failures.dart';
import '../../domain/repositories/registration_repository.dart';
import '../sources/registration_data_source.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationDataSourceImpl registrationDataSourceImpl;

  RegistrationRepositoryImpl(this.registrationDataSourceImpl);

  @override
  Future<Either<Failure, int>> registerUser({
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
          staffId: staffId,
          role: role,
          email: email,
          phone: phone,
          password: password,
          gender: gender,
        ),
      );
    } on DatabaseException {
      return Left(DatabaseFailure('T', ''));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser({
    String name,
    String staffId,
    String role,
    String email,
    String phone,
    String password,
    String gender,
  }) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
