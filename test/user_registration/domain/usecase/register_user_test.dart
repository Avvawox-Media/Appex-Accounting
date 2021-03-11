import 'package:appex_accounting/features/user_registration/domain/repositories/registration_repository.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRegistrationRepository extends Mock
    implements RegistrationRepository {}

void main() {
  MockRegistrationRepository mockRegistrationRepository;
  RegisterUser registerUser;

  setUp(() {
    mockRegistrationRepository = MockRegistrationRepository();
    registerUser = RegisterUser(mockRegistrationRepository);
  });

  final int index = 0;
  //test
  test('should return a registered user with integer id', () async {
    //arrange
    when(mockRegistrationRepository.registerUser(
            staffId: anyNamed('staffId'),
            name: anyNamed('name'),
            role: anyNamed('role'),
            email: anyNamed('email'),
            phone: anyNamed('phone'),
            password: anyNamed('password'),
            gender: anyNamed('gender')))
        .thenAnswer((_) async => Right(index));

    //act
    final result = await registerUser(RegistrationParams(
        name: '',
        staffId: '',
        email: '',
        role: '',
        phone: '',
        password: '',
        gender: ''));

    //assert
    verify(
      mockRegistrationRepository.registerUser(
          name: '',
          role: '',
          email: '',
          phone: '',
          password: '',
          gender: '',
          staffId: ''),
    );
    expect(result, Right(index));
    verifyNoMoreInteractions(mockRegistrationRepository);
  });
}
