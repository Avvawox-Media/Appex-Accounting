import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class DatabaseFailure extends Failure {
  final String title;
  final String message;

  DatabaseFailure(this.title, this.message);

  @override
  List<Object> get props => [];
}
