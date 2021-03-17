import 'package:appex_accounting/features/services/data/sources/service_data_source.dart';
import 'package:appex_accounting/features/services/domain/entities/service.dart';
import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/services/domain/repositories/service_repository.dart';
import 'package:dartz/dartz.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceDataSource serviceDataSource;

  ServiceRepositoryImpl(this.serviceDataSource);

  @override
  Future<Either<Failure, int>> createService({
    String id,
    String title,
    String description,
    double cost,
    String date,
    double amount,
    double balance,
  }) async {
    try {
      return Right(await serviceDataSource.createService());
    } catch (e) {
      return Left(DatabaseFailure('Error', e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteService(String serviceId) async {
    try {
      return Right(await serviceDataSource.deleteService(serviceId));
    } catch (e) {
      return Left(DatabaseFailure('Error', e));
    }
  }

  @override
  Future<Either<Failure, Service>> getService(String serviceId) async {
    try {
      return Right(await serviceDataSource.getService(serviceId));
    } catch (e) {
      return Left(DatabaseFailure('Error', e));
    }
  }

  @override
  Future<Either<Failure, List<Service>>> getServices() async {
    try {
      return Right(await serviceDataSource.getServices());
    } catch (e) {
      return Left(DatabaseFailure('Error', e));
    }
  }

  @override
  Future<Either<Failure, bool>> updateService(
      {String id,
      String title,
      String description,
      double cost,
      String date,
      double amount,
      double balance}) async {
    try {
      return Right(await serviceDataSource.updateService());
    } catch (e) {
      return Left(DatabaseFailure('Error', e));
    }
  }
}
