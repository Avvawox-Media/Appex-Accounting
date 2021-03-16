import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:appex_accounting/features/user_authentication/domain/repositories/user_authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthenticateUser extends UseCase<AuthenticatedUser, AuthParams> {
  final UserAuthenticationRepository userAuthenticationRepository;

  AuthenticateUser(this.userAuthenticationRepository);

  @override
  Future<Either<Failure, AuthenticatedUser>> call(params) async {
    return await userAuthenticationRepository.authenticateUser(
        params.username, params.password);
  }
}

class AuthParams extends Equatable {
  final String username;
  final String password;

  AuthParams(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
