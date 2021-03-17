import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/services/domain/entities/service.dart';
import 'package:appex_accounting/features/services/domain/repositories/service_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetService extends UseCase<Service, GetServiceParams> {
  final ServiceRepository serviceRepository;

  GetService(this.serviceRepository);

  @override
  Future<Either<Failure, Service>> call(params) {
    return serviceRepository.getService(params.serviceId);
  }
}

class GetServiceParams extends Equatable {
  final String serviceId;

  GetServiceParams(this.serviceId);

  @override
  List<Object> get props => [serviceId];
}
