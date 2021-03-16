import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/core/exceptions/exceptions.dart';
import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/features/user_authentication/data/models/authenticated_user_model.dart';
import 'package:appex_accounting/features/user_authentication/domain/usecases/authenticate_user.dart';
import 'package:appex_accounting/features/user_registration/data/models/registered_user_model.dart';
import 'package:crypt/crypt.dart';

abstract class UserAuthenticationDataSource {
  Future<AuthenticatedUserModel> authenticateUser(
      String username, String password);
}

class UserAuthenticationDataSourceImpl implements UserAuthenticationDataSource {
  final DatabaseHelper databaseHelper;

  UserAuthenticationDataSourceImpl(this.databaseHelper);

  @override
  Future<AuthenticatedUserModel> authenticateUser(
    String username,
    String password,
  ) async {
    //Initialize Database
    await databaseHelper.initDatabase();
    await databaseHelper.open(USERS_BOX);

    //
    AuthenticatedUserModel userModel;

    List<dynamic> userDataList = await databaseHelper.getAllItem(USERS_BOX);
    List<String> usernames = [];
    List<String> passwords = [];

    for (dynamic user in userDataList) {
      userModel = AuthenticatedUserModel.fromJson(user.toString());

      usernames.add(userModel.email);
      passwords.add(userModel.password);
    }

    //Encrypt and match Password Here

    if (usernames.contains(username)) {
      int index = usernames.indexOf(username);

      final encryptedPassword = Crypt.sha256(password, salt: 'axcecpopuan@t');

      if (passwords.elementAt(index) == encryptedPassword.toString()) {
        print('User Authenticated');
        return userModel;
      } else {
        throw ('Incorrect username or password');
      }
    } else {
      throw ('User does not exist');
    }
  }
}
