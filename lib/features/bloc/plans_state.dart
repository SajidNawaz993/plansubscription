part of 'plans_bloc.dart';

abstract class PlansState extends Equatable {}

class PlansInitial extends PlansState {
  @override
  List<Object?> get props => [];
}

class PlansLoading extends PlansState {
  @override
  List<Object?> get props => [];
}

class PlansLoaded extends PlansState {
  final PlansListModel plansListModel;

  PlansLoaded({
    required this.plansListModel,
  });

  @override
  List<Object?> get props => [plansListModel];
}

class PlansError extends PlansState {
  final String errorMessage;
  PlansError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
