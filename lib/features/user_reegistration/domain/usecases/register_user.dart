import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/user_reegistration/domain/entities/registered_user.dart';
import 'package:appex_accounting/features/user_reegistration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RegisterUser extends UseCase<RegisteredUser, RegistrationParams> {
  final RegistrationRepository registrationRepository;

  RegisterUser(this.registrationRepository);

  @override
  Future<Either<Failure, RegisteredUser>> call(params) async {
    return await registrationRepository.registerUser(
      name: params.name,
      role: params.name,
      email: params.email,
      phone: params.phone,
      password: params.password,
      gender: params.gender,
    );
  }
}

class RegistrationParams extends Equatable {
  final String name;
  final String staffId;
  final String role;
  final String email;
  final String phone;
  final String password;
  final String gender;

  RegistrationParams({
    @required this.name,
    this.staffId,
    @required this.role,
    @required this.email,
    @required this.phone,
    @required this.password,
    @required this.gender,
  });

  @override
  List<Object> get props => [
        name,
        role,
        email,
        staffId,
        password,
        gender,
      ];
}
