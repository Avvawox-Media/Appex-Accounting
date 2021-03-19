part of 'service_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object> get props => [];
}

class ServiceInitial extends ServiceState {}

class LoadingState extends ServiceState {}

class ServiceCreatedState extends ServiceState {
  final int index;

  ServiceCreatedState(this.index);
}

class ServiceUpdatedState extends ServiceState {
  final bool updated;

  ServiceUpdatedState(this.updated);
}

class ServiceErrorState extends ServiceState {
  final Failure failure;

  ServiceErrorState(this.failure);
}
