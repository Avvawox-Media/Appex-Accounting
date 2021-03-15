import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/user_registration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RemoveUser extends UseCase<bool, RemoveUserParams> {
  final RegistrationRepository registrationRepository;

  RemoveUser(this.registrationRepository);

  @override
  Future<Either<Failure, bool>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class RemoveUserParams extends Equatable {
  final String key;

  RemoveUserParams(this.key);

  @override
  List<Object> get props => [key];
}
