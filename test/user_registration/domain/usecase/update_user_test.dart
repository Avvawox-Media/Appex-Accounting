import 'package:appex_accounting/features/user_registration/domain/repositories/registration_repository.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/update_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRegistrationRepository extends Mock
    implements RegistrationRepository {}

void main() {
  MockRegistrationRepository mockRegistrationRepository;
  UpdateUser updateUser;

  setUp(() {
    mockRegistrationRepository = MockRegistrationRepository();
    updateUser = UpdateUser(mockRegistrationRepository);
  });

  //test
  test(
      'should return void after updating the user\'s information in the database',
      () async {
    //arrange
    when(mockRegistrationRepository.updateUser(
      staffId: anyNamed('staffId'),
      name: anyNamed('name'),
      role: anyNamed('role'),
      email: anyNamed('email'),
      phone: anyNamed('phone'),
      password: anyNamed('password'),
      gender: anyNamed('gender'),
    )).thenAnswer((_) async => Right(null));
    //act
    final result = await updateUser(
      UpdateParams(
        staffId: '',
        email: '',
        phone: '',
        gender: '',
        password: '',
        role: '',
        name: '',
      ),
    );
    //assert
    expect(result, Right(null));
  });
}
