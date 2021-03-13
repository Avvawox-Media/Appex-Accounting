import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:dartz/dartz.dart';

abstract class UserAuthenticationRepository {
  Future<Either<Failure, AuthenticatedUser>> authenticateUser(
      String username, String password);
}
