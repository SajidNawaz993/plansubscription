part of 'plans_bloc.dart';

@immutable
abstract class PlansEvent extends Equatable {
  const PlansEvent();

  @override
  List<Object> get props => [];
}

class PerformPlansList extends PlansEvent {

  const PerformPlansList();

  @override
  List<Object> get props => [];
}
