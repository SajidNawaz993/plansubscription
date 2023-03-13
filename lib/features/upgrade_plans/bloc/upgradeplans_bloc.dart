import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../plans/data/plans_List_model.dart';
import '../data/upgradeplans_repository.dart';
part 'upgradeplans_event.dart';
part 'upgradeplans_state.dart';

class UpgradePlansBloc extends Bloc<UpgradePlansEvent, UpgradePlansState> {
  UpgradePlansBloc({required this.repository}) : super(UpgradePlansInitial()) {
    on<PerformUpgradePlansList>(_onPerformUpgradePlansList);
  }

  final UpgradePlansRepository repository;

  void _onPerformUpgradePlansList(PerformUpgradePlansList event, emit) async {
    try {
      // emit the loading state
      emit(UpgradePlansLoading());
      final plansListModel = await repository.requestUpgradePlans();
      emit(UpgradePlansLoaded(plansListModel: plansListModel));
    } on Exception catch (e) {
      emit(UpgradePlansError(errorMessage: e.toString()));
    }
  }
}
