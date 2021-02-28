import 'package:appex_accounting/core/exceptions/exceptions.dart';
import 'package:appex_accounting/core/shared_preferences/shared_prefs.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const DATABASE_NAME = 'DATABASE_NAME';

class DatabaseManager {
  final SharedPrefs sharedPrefs;

  DatabaseManager(this.sharedPrefs);

  Future<bool> createDatabase() async {
    try {
      final String databaseName =
          await sharedPrefs.getData(DATABASE_NAME, 'String');

      openDatabase(
        join(await getDatabasesPath(), databaseName),
        onCreate: (db, version) {
          Batch batch = db.batch();

          //
          String servicesSql =
              'CREATE TABLE services_tbl(service_id TEXT PRIMARY KEY, type TEXT, ' +
                  'description TEXT, cost INTEGER, amount INTEGER, balance INTEGER, ' +
                  'delivery TEXT, date TEXT, payment_date TEXT, delivery_date TEXT)';

          ///Finances Tables
          String inflowSql = 'CREATE TABLE inflow_tbl(id INTEGER PRIMARY KEY, ' +
              'service_id TEXT, description TEXT, amount INTEGER, date TEXT)';

          String outflowSql = 'CREATE TABLE outflow(id INTEGER PRIMARY KEY, ' +
              'reason TEXT,  amount INTEGER, date TEXT)';

          //Users Table
          String usersSql =
              'CREATE TABLE users_tbl(staff_id TEXT PRIMARY KEY, name TEXT, ' +
                  'role TEXT, email TEXT, phone TEXT, gender TEXT, date TEXT)';

          //Enquiries Table
          String enquiriesSql =
              'CREATE TABLE enquiries_tbl(id INTEGER PRIMARY KEY, customer TEXT, ' +
                  'details TEXT, phone TEXT, date TEXT)';

          //Enquiries Table
          String customerSql =
              'CREATE TABLE enquiries_tbl(id INTEGER PRIMARY KEY, customer TEXT, ' +
                  'email TEXT, phone TEXT, date TEXT)';

          batch.execute(servicesSql);
          batch.execute(inflowSql);
          batch.execute(outflowSql);
          batch.execute(usersSql);
          batch.execute(enquiriesSql);
          batch.execute(customerSql);
        },
        version: 1,
      );

      return true;
    } on CacheException {
      return false;
    } on SqlException {
      return false;
    }
  }

  ///
  Future<bool> insertData(String tabeName) {}

  ///
  Future<bool> updateData(String tableName) {}

  ///
  Future<bool> deleteData(String tableName, String condition) {}
}
