

import 'package:bloc/bloc.dart';
import 'package:plansubscription/features/plan_detail/bloc/plans_details_event.dart';
import 'package:plansubscription/features/plan_detail/bloc/plans_details_state.dart';

class PlanDetailsBloc extends Bloc<PlanDetailsEvent, PlanDetailsState> {
  PlanDetailsBloc() : super(CounterValue()) {}
}