import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/features/user_registration/data/sources/registration_data_source.dart';
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
  test('should return a registered user model with integer id', () async {
    //arrange
    when(mockDatabaseHelper.save(any, any)).thenAnswer((_) async => 0);

    //act
    final result = await registrationDataSource.registerUser(
        staffId: 'staffId',
        name: 'name',
        role: 'role',
        email: 'email',
        phone: 'phone',
        password: 'password',
        gender: 'gender');

    //assert
    expect(result, (0));
  });

  //test
  test('should return a void after updating user information', () async {
    //arrange
    when(mockDatabaseHelper.update(any, any, any))
        .thenAnswer((_) async => true);

    //act
    final result = await registrationDataSource.updateUser(
      staffId: 'staffId',
      name: 'name',
      role: 'role',
      email: 'email',
      phone: 'phone',
      password: 'password',
      gender: 'gender',
    );

    //assert
    expect(result, true);
  });
}
