import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/usecase/usecase.dart';
import 'package:appex_accounting/features/services/domain/entities/service.dart';
import 'package:appex_accounting/features/services/domain/repositories/service_repository.dart';
import 'package:dartz/dartz.dart';

class GetService extends UseCase<List<Service>, GetServicesParams> {
  final ServiceRepository serviceRepository;

  GetService(this.serviceRepository);

  @override
  Future<Either<Failure, List<Service>>> call(params) {
    return serviceRepository.getServices();
  }
}

class GetServicesParams {}
