import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final String id;
  final String title;
  final String description;
  final double cost;
  final String date;
  final double amount;
  final double balance;

  Service({
    this.id,
    this.title,
    this.description,
    this.cost,
    this.date,
    this.amount,
    this.balance,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        cost,
        date,
        amount,
        balance,
      ];
}
