import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/services/domain/entities/service.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

abstract class ServiceRepository {
  ///Contract to [createService] and adding a service order
  ///with parammeter
  Future<Either<Failure, int>> createService({
    @required String id,
    @required String title,
    @required String description,
    @required double cost,
    @required String date,
    @required double amount,
    @required double balance,
  });

  ///
  Future<Either<Failure, Service>> getService(String jobId);

  ///
  Future<Either<Failure, List<Service>>> getServices();

  ///
  Future<Either<Failure, bool>> updateService({
    @required String id,
    @required String title,
    @required String description,
    @required double cost,
    @required String date,
    @required double amount,
    @required double balance,
  });

  ///
  Future<Either<Failure, bool>> deleteService(String serviceId);
}
