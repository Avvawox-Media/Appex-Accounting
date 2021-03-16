import 'package:appex_accounting/core/exceptions/exceptions.dart';
import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/features/user_authentication/data/models/authenticated_user_model.dart';
import 'package:appex_accounting/features/user_authentication/data/repositories/user_authentication_repository_impl.dart';
import 'package:appex_accounting/features/user_authentication/data/sources/user_authentication_data_source.dart';
import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationDataSourceImpl extends Mock
    implements UserAuthenticationDataSourceImpl {}

void main() {
  MockAuthenticationDataSourceImpl mockAuthenticationDataSourceImpl;
  UserAuthenticationRepositoryImpl userAuthenticationRepositoryImpl;

  setUp(() {
    mockAuthenticationDataSourceImpl = MockAuthenticationDataSourceImpl();
    userAuthenticationRepositoryImpl = UserAuthenticationRepositoryImpl(
      mockAuthenticationDataSourceImpl,
    );
  });

  AuthenticatedUser authenticatedUser = AuthenticatedUserModel(
    name: '',
    password: '',
    role: '',
    gender: '',
    email: '',
    phone: '',
    staffId: '',
  );

  //test
  test('Should return a valid authenticated user model', () async {
    //arrange
    when(mockAuthenticationDataSourceImpl.authenticateUser(any, any))
        .thenAnswer(
      (_) async => AuthenticatedUserModel(
        name: '',
        password: '',
        role: '',
        gender: '',
        email: '',
        phone: '',
        staffId: '',
      ),
    );
    //act
    final result =
        await userAuthenticationRepositoryImpl.authenticateUser('', '');
    //assert
    expect(
      result,
      Right(authenticatedUser),
    );
  });

  //test
  test('Should return a DatabaseFailure on Database exception', () async {
    //arrange
    when(mockAuthenticationDataSourceImpl.authenticateUser(any, any))
        .thenThrow(DatabaseException());

    //act
    final result =
        await userAuthenticationRepositoryImpl.authenticateUser('', '');
    //assert
    expect(
      result,
      Left(DatabaseFailure(DB_FAILURE_TITLE, DB_AUTH_USER_FAILURE_MESSAGE)),
    );
  });
}
