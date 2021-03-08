import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/features/user_reegistration/data/models/registered_user_model.dart';
import 'package:appex_accounting/features/user_reegistration/data/sources/registration_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MockDatabaseHelper mockDatabaseHelper;
  RegistrationDataSourceImpl registrationDataSource;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    registrationDataSource = RegistrationDataSourceImpl(mockDatabaseHelper);
  });

  //test
  test('should return a registered user with integer id', () async {
    //arrange
    when(mockDatabaseHelper.insertData(
            tableName: USERS_TABLE, data: anyNamed('data')))
        .thenAnswer((_) async => 0);

    //act
    final result = await registrationDataSource.registerUser(
        name: 'name',
        role: 'role',
        email: 'email',
        phone: 'phone',
        password: 'password',
        gender: 'gender');

    //assert
    expect(result, RegisteredUserModel(0));
  });
}
