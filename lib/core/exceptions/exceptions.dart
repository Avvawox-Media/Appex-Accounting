// class SqlException implements DatabaseException {}

class DatabaseException implements Exception {
  final String _message;

  DatabaseException(this._message);

  String get message => _message;
}

class CacheException implements Exception {}

class ServerException implements Exception {}
