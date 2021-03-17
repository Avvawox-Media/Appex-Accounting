import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/services/domain/repositories/service_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeleteService extends UseCase<bool, DeleteServiceParams> {
  final ServiceRepository serviceRepository;

  DeleteService(this.serviceRepository);

  @override
  Future<Either<Failure, bool>> call(params) {
    return serviceRepository.deleteService(params.serviceId);
  }
}

class DeleteServiceParams extends Equatable {
  final String serviceId;

  DeleteServiceParams(this.serviceId);

  @override
  List<Object> get props => [serviceId];
}
