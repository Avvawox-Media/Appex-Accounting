import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/features/user_authentication/data/models/authenticated_user_model.dart';
import 'package:appex_accounting/features/user_authentication/data/sources/user_authentication_data_source.dart';
import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main() {
  MockDatabaseHelper mockDatabaseHelper;
  UserAuthenticationDataSourceImpl userAuthenticationDataSourceImpl;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    userAuthenticationDataSourceImpl =
        UserAuthenticationDataSourceImpl(mockDatabaseHelper);
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
  test('Should get the appropriate user data from the database', () async {
    //arrange
    when(mockDatabaseHelper.getItem(any, any))
        .thenAnswer((_) async => AuthenticatedUserModel(
              name: '',
              password: '',
              role: '',
              gender: '',
              email: '',
              phone: '',
              staffId: '',
            ));
    //act
    final result =
        await userAuthenticationDataSourceImpl.authenticateUser('', '');
    //assert
    expect(result, authenticatedUser);
  });
}
