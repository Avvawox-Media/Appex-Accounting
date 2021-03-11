import '../utils/strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:meta/meta.dart';

@deprecated
class DatabaseManager {
  DatabaseManager._instance();
  static final DatabaseManager instance = DatabaseManager._instance();

  /// Initialize [_databaseName] and [_databaseVersion] with Name stored in sharedPrefrences
  /// Database Name and an appropriate version number for every app version
  final String _databaseName = DATABASE_PREFIX + 'Tester';
  final int _databaseVersion = 1;

  static Database _database;

  ///Create Single App-wide reference to the Database
  Future<Database> get database async {
    //Check if a connection to the database already exists
    if (_database != null) return _database;

    //Lazily initiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  ///Initial Databae on first access
  _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreateDb);
  }

  //Create database
  Future _onCreateDb(Database db, int version) async {
    final Batch batch = db.batch();

    //Services Table
    String servicesSql =
        'CREATE TABLE services_tbl(service_id TEXT PRIMARY KEY AUTOINCREMENT, type TEXT, ' +
            'description TEXT, cost INTEGER, amount INTEGER, balance INTEGER, ' +
            'delivery TEXT, date TEXT, payment_date TEXT, delivery_date TEXT)';

    ///Finances Tables
    String inflowSql =
        'CREATE TABLE inflow_tbl(id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
            'service_id TEXT, description TEXT, amount INTEGER, date TEXT)';

    String outflowSql = 'CREATE TABLE outflow_tbl(id INTEGER PRIMARY KEY, ' +
        'reason TEXT,  amount INTEGER, date TEXT)';

    //Users Table
    String usersSql =
        'CREATE TABLE users_tbl(id INTEGER PRIMARY KEY AUTOINCREMENT, staff_id TEXT, name TEXT, ' +
            'role TEXT, email TEXT, phone TEXT, gender TEXT, date TEXT)';

    //Enquiries Table
    String enquiriesSql =
        'CREATE TABLE enquiries_tbl(id INTEGER PRIMARY KEY AUTOINCREMENT, customer TEXT, ' +
            'details TEXT, phone TEXT, date TEXT)';

    //Enquiries Table
    String customerSql =
        'CREATE TABLE customers_tbl(id INTEGER PRIMARY KEY AUTOINCREMENT, customer TEXT, ' +
            'email TEXT, phone TEXT, date TEXT)';

    batch.execute(servicesSql);
    batch.execute(inflowSql);
    batch.execute(outflowSql);
    batch.execute(usersSql);
    batch.execute(enquiriesSql);
    batch.execute(customerSql);
  }

  /// [Inserts] a row in a selected database table with [tableName] where each key in the Map
  /// is a column-[name] and the value is the column [value]. The return value is the id of the
  /// inserted row.
  Future<int> insertData({
    @required String tableName,
    @required Map<String, dynamic> data,
  }) async {
    Database database = await instance.database;

    return await database.insert(tableName, data);
  }

  /// We are assuming here that the id column in the map is set. The other
  /// column values will be used to update the row.
  Future<int> updateDataById({
    @required String tableName,
    @required Map<String, dynamic> data,
    String key,
    String columnName,
  }) async {
    Database database = await instance.database;

    int id = data[key];

    return await database.update(
      tableName,
      data,
      where: '$columnName = ?',
      whereArgs: [id],
    );
  }

  /// Deletes the row specified by the [id]. The number of affected rows is
  /// returned. This should be 1 as long as the row exists.
  Future<int> deleteDataById(
      String tableName, String columnName, int id) async {
    Database database = await instance.database;

    return await database.delete(
      tableName,
      where: '$columnName = ?',
      whereArgs: [id],
    );
  }

  /// All of the rows int a table with specific [tableName] are returned as a list of maps,
  /// where each map is a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    Database db = await instance.database;

    return await db.query(tableName);
  }

  /// This method uses a raw query to give the row count.
  Future<int> queryRowCount(String tableName) async {
    Database db = await instance.database;

    return Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $tableName'),
    );
  }
}
