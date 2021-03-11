import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/user_registration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateUser extends UseCase<void, UpdateParams> {
  final RegistrationRepository registrationRepository;

  UpdateUser(this.registrationRepository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await registrationRepository.updateUser(
      name: params.name,
      staffId: params.staffId,
      role: params.role,
      password: params.password,
      phone: params.phone,
      email: params.email,
      gender: params.gender,
    );
  }
}

class UpdateParams extends Equatable {
  final String staffId;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String gender;
  final String role;

  UpdateParams({
    this.staffId,
    this.email,
    this.phone,
    this.password,
    this.gender,
    this.role,
    this.name,
  });
  @override
  List<Object> get props =>
      [staffId, name, email, role, phone, password, gender];
}
