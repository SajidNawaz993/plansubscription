part of 'upgradeplans_bloc.dart';

@immutable
abstract class UpgradePlansEvent extends Equatable {
  const UpgradePlansEvent();

  @override
  List<Object> get props => [];
}

class PerformUpgradePlansList extends UpgradePlansEvent {

  const PerformUpgradePlansList();

  @override
  List<Object> get props => [];
}
