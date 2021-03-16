import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/features/user_authentication/data/sources/user_authentication_data_source.dart';
import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/user_authentication/domain/repositories/user_authentication_repository.dart';
import 'package:dartz/dartz.dart';

class UserAuthenticationRepositoryImpl implements UserAuthenticationRepository {
  final UserAuthenticationDataSourceImpl userAuthenticationDataSourceImpl;

  UserAuthenticationRepositoryImpl(this.userAuthenticationDataSourceImpl);

  @override
  Future<Either<Failure, AuthenticatedUser>> authenticateUser(
      String username, String password) async {
    try {
      return Right(await userAuthenticationDataSourceImpl.authenticateUser(
        username,
        password,
      ));
    } catch (e) {
      print(e);
      return Left(DatabaseFailure(DB_FAILURE_TITLE, e));
    }
  }
}
