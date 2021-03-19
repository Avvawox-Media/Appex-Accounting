import 'dart:async';

import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/services/domain/usecases/create_service.dart';
import 'package:appex_accounting/features/services/domain/usecases/delete_service.dart';
import 'package:appex_accounting/features/services/domain/usecases/get_service.dart';
import 'package:appex_accounting/features/services/domain/usecases/get_services.dart';
import 'package:appex_accounting/features/services/domain/usecases/update_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final CreateService createService;
  final UpdateService updateService;
  final GetService getService;
  final GetServices getServices;
  final DeleteService deleteService;

  ServiceBloc({
    this.createService,
    this.updateService,
    this.getService,
    this.getServices,
    this.deleteService,
  }) : super(ServiceInitial());

  @override
  Stream<ServiceState> mapEventToState(
    ServiceEvent event,
  ) async* {
    if (event is CreateServiceEvent) {
      //Emits Loading State
      yield LoadingState();

      final resultOrFailure = await createService(CreateServiceParams(
        event.id,
        event.title,
        event.description,
        event.cost,
        event.date,
        event.amount,
        event.balance,
      ));

      //Emits Loaded or Error State
      yield resultOrFailure.fold(
        (failure) => ServiceErrorState(failure),
        (index) => ServiceCreatedState(index),
      );
    }
  }
}
