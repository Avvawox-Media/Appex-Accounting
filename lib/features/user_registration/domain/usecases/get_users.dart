import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/user_registration/domain/entities/registered_user.dart';
import 'package:appex_accounting/features/user_registration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetUsers extends UseCase<List<RegisteredUser>, GetUserParams> {
  final RegistrationRepository registrationRepository;

  GetUsers(this.registrationRepository);

  @override
  Future<Either<Failure, List<RegisteredUser>>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetUserParams extends Equatable {
  @override
  List<Object> get props => [];
}
