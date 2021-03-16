import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:appex_accounting/features/user_authentication/domain/repositories/user_authentication_repository.dart';
import 'package:appex_accounting/features/user_authentication/domain/usecases/authenticate_user.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthenticationRepository extends Mock
    implements UserAuthenticationRepository {}

void main() {
  MockAuthenticationRepository mockAuthenticationRepository;
  AuthenticateUser authenticateUser;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    authenticateUser = AuthenticateUser(mockAuthenticationRepository);
  });

  //test
  test('Should return an authenticated user with a session token', () async {
    //arrange
    when(mockAuthenticationRepository.authenticateUser(any, any)).thenAnswer(
      (_) async => Right(
        AuthenticatedUser(
          name: '',
          password: '',
          role: '',
          gender: '',
          email: '',
          phone: '',
          staffId: '',
        ),
      ),
    );
    //act
    final result = await authenticateUser(AuthParams('', ''));
    //assert

    verify(mockAuthenticationRepository.authenticateUser('', ''));
    expect(
      result,
      Right(AuthenticatedUser(
        name: '',
        password: '',
        role: '',
        gender: '',
        email: '',
        phone: '',
        staffId: '',
      )),
    );
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });
}
