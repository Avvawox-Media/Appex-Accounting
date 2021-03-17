import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/services/domain/repositories/service_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateService extends UseCase<int, CreateServiceParams> {
  final ServiceRepository serviceRepository;

  CreateService(this.serviceRepository);

  @override
  Future<Either<Failure, int>> call(CreateServiceParams params) {
    return serviceRepository.createService(
        id: params.id,
        title: params.title,
        description: params.description,
        cost: params.cost,
        date: params.date,
        amount: params.amount,
        balance: params.balance);
  }
}

class CreateServiceParams extends Equatable {
  final String id;
  final String title;
  final String description;
  final double cost;
  final String date;
  final double amount;
  final double balance;

  CreateServiceParams(
    this.id,
    this.title,
    this.description,
    this.cost,
    this.date,
    this.amount,
    this.balance,
  );

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
