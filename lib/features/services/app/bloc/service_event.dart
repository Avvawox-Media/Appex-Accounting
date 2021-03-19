part of 'service_bloc.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class CreateServiceEvent extends ServiceEvent {
  final String id;
  final String title;
  final String description;
  final double cost;
  final String date;
  final double amount;
  final double balance;

  CreateServiceEvent(
    this.id,
    this.title,
    this.description,
    this.cost,
    this.date,
    this.amount,
    this.balance,
  );
}
