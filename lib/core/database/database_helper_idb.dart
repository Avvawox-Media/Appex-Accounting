import 'package:idb_sqflite/idb_client_sqflite.dart';
import 'package:idb_sqflite/idb_sqflite.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  ///Creates a singleton class instance for accessing the database
  DatabaseHelper._instance();
  final DatabaseHelper instance = DatabaseHelper._instance();

  DatabaseFactory factory;

  //Database _database;

  Future<void> get database {
    final databaseFactory = getIdbFactorySqflite(factory);
  }
}
