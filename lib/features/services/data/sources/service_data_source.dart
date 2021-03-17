import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/features/services/data/models/service_model.dart';
import 'package:appex_accounting/features/services/domain/entities/service.dart';

abstract class ServiceDataSource {
  Future<int> createService({
    String id,
    String title,
    String description,
    double cost,
    String date,
    double amount,
    double balance,
  });

  Future<bool> updateService({
    String id,
    String title,
    String description,
    double cost,
    String date,
    double amount,
    double balance,
  });

  Future<ServiceModel> getService(String serviceId);

  Future<List<Service>> getServices();

  Future<bool> deleteService(String serviceId);
}

class ServiceDataSourceImpl implements ServiceDataSource {
  final DatabaseHelper databaseHelper;

  ServiceDataSourceImpl(this.databaseHelper);

  @override
  Future<int> createService(
      {String id,
      String title,
      String description,
      double cost,
      String date,
      double amount,
      double balance}) async {
    //
    final serviceModel = ServiceModel(
      id: id,
      title: title,
      description: description,
      cost: cost,
      date: date,
      amount: amount,
      balance: balance,
    ).toJson();

    return await databaseHelper.save(SERVICES_BOX, serviceModel);
  }

  @override
  Future<bool> updateService(
      {String id,
      String title,
      String description,
      double cost,
      String date,
      double amount,
      double balance}) async {
    //
    final serviceModel = ServiceModel(
      id: id,
      title: title,
      description: description,
      cost: cost,
      date: date,
      amount: amount,
      balance: balance,
    ).toJson();

    await databaseHelper.update(id, SERVICES_BOX, serviceModel);

    return true;
  }

  @override
  Future<bool> deleteService(String serviceId) async {
    await databaseHelper.remove(serviceId, SERVICES_BOX);

    return true;
  }

  @override
  Future<ServiceModel> getService(String serviceId) async {
    dynamic serviceDynamic =
        await databaseHelper.getItem(serviceId, SERVICES_BOX);
    String serviceString = serviceDynamic.toString();

    return ServiceModel.fromJson(serviceString);
  }

  @override
  Future<List<Service>> getServices() async {
    List<Service> serviceList = [];

    final data = await databaseHelper.getAllItem(SERVICES_BOX);

    for (dynamic service in data) {
      final result = ServiceModel.fromJson(service.toString());

      serviceList.add(result);
    }

    return serviceList;
  }
}
