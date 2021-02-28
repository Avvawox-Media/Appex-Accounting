import 'package:appex_accounting/features/user_reegistration/domain/entities/registered_user.dart';
import 'package:appex_accounting/features/user_reegistration/domain/repositories/registration_repository.dart';
import 'package:appex_accounting/features/user_reegistration/domain/usecases/register_user.dart';
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

  final registeredUser = RegisteredUser('');
  //test
  test('should return a registered user', () async {
    //arrange
    when(mockRegistrationRepository.registerUser(
            name: anyNamed('name'),
            role: anyNamed('role'),
            email: anyNamed('email'),
            phone: anyNamed('phone'),
            password: anyNamed('password'),
            gender: anyNamed('gender')))
        .thenAnswer((realInvocation) async => Right(registeredUser));

    //act
    final result = await registerUser(RegistrationParams(
      name: '',
      staffId: '',
      email: '',
      role: '',
      phone: '',
      password: '',
      gender: '',
    ));

    //assert
    verify(mockRegistrationRepository.registerUser(
        name: '', role: '', email: '', phone: '', password: '', gender: ''));
    expect(result, Right(registeredUser));
    verifyNoMoreInteractions(mockRegistrationRepository);
  });
}
