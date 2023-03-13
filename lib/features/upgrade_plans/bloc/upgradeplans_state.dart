part of 'upgradeplans_bloc.dart';

abstract class UpgradePlansState extends Equatable {}

class UpgradePlansInitial extends UpgradePlansState {
  @override
  List<Object?> get props => [];
}

class UpgradePlansLoading extends UpgradePlansState {
  @override
  List<Object?> get props => [];
}

class UpgradePlansLoaded extends UpgradePlansState {
  final PlansListModel plansListModel;

  UpgradePlansLoaded({
    required this.plansListModel,
  });

  @override
  List<Object?> get props => [plansListModel];
}

class UpgradePlansError extends UpgradePlansState {
  final String errorMessage;
  UpgradePlansError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
