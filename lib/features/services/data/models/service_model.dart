import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:appex_accounting/features/services/domain/entities/service.dart';

class ServiceModel extends Service {
  final String id;
  final String title;
  final String description;
  final double cost;
  final String date;
  final double amount;
  final double balance;

  ServiceModel({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.cost,
    @required this.date,
    @required this.amount,
    @required this.balance,
  }) : super(
          id: id,
          title: title,
          description: description,
          cost: cost,
          date: date,
          amount: amount,
          balance: balance,
        );

  factory ServiceModel.fromJson(String jsonString) {
    final data = json.decode(jsonString);

    return ServiceModel(
      id: data['service_id'],
      title: data['title'],
      description: data['description'],
      cost: data['cost'],
      date: data['date'],
      amount: data['amount'],
      balance: data['balance'],
    );
  }

  String toJson() {
    Map<String, dynamic> result = {
      'service_id': id,
      'title': title,
      'description': description,
      'cost': cost,
      'date': date,
      'amount': amount,
      'balance': balance,
    };

    return json.encode(result);
  }
}
