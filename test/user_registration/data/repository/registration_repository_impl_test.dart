import 'package:appex_accounting/core/exceptions/exceptions.dart';
import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/user_reegistration/data/models/registered_user_model.dart';
import 'package:appex_accounting/features/user_reegistration/data/repositories/registration_repository_impl.dart';
import 'package:appex_accounting/features/user_reegistration/data/sources/registration_data_source.dart';
import 'package:appex_accounting/features/user_reegistration/domain/entities/registered_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRegistrationDataSource extends Mock
    implements RegistrationDataSourceImpl {}

void main() {
  MockRegistrationDataSource mockRegistrationDataSource;
  RegistrationRepositoryImpl registrationRepositoryImpl;

  setUp(() {
    mockRegistrationDataSource = MockRegistrationDataSource();
    registrationRepositoryImpl =
        RegistrationRepositoryImpl(mockRegistrationDataSource);
  });

  final RegisteredUser registeredUser = RegisteredUserModel(0);

  //test
  test('should return a valid RegisteredUserModel', () async {
    //arrange
    when(mockRegistrationDataSource.registerUser(
            name: anyNamed('name'),
            role: anyNamed('role'),
            email: anyNamed('email'),
            phone: anyNamed('phone'),
            password: anyNamed('password'),
            gender: anyNamed('gender')))
        .thenAnswer((_) async => RegisteredUserModel(0));
    //act
    final result = await registrationRepositoryImpl.registerUser(
        name: '', role: '', email: '', phone: '', password: '', gender: '');

    //assert
    verify(mockRegistrationDataSource.registerUser(
        name: '', role: '', email: '', phone: '', password: '', gender: ''));
    expect(result, Right(registeredUser));
    verifyNoMoreInteractions(mockRegistrationDataSource);
  });

  //test
  test('should return a DatabaseFailure', () async {
    //arrange
    when(mockRegistrationDataSource.registerUser(
            name: anyNamed('name'),
            role: anyNamed('role'),
            email: anyNamed('email'),
            phone: anyNamed('phone'),
            password: anyNamed('password'),
            gender: anyNamed('gender')))
        .thenAnswer((_) async => throw SqlException());
    //act
    final result = await registrationRepositoryImpl.registerUser(
        name: '', role: '', email: '', phone: '', password: '', gender: '');

    //assert
    verify(mockRegistrationDataSource.registerUser(
        name: '', role: '', email: '', phone: '', password: '', gender: ''));
    expect(result, Left(DatabaseFailure('T', 'M')));
    verifyNoMoreInteractions(mockRegistrationDataSource);
  });
}
