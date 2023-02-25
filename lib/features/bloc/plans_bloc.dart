import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:plansubscription/features/data/plans_List_model.dart';
import '../data/plans_repository.dart';

part 'plans_event.dart';
part 'plans_state.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  PlansBloc({required this.repository}) : super(PlansInitial()) {
    on<PerformPlansList>(_onPerformPlansList);
  }

  final PlansRepository repository;

  void _onPerformPlansList(PerformPlansList event, emit) async {
    try {
      // emit the loading state
      emit(PlansLoading());
      final plansListModel = await repository.requestPlans();
      emit(PlansLoaded(plansListModel: plansListModel));
    } on Exception catch (e) {
      emit(PlansError(errorMessage: e.toString()));
    }
  }
}
