// throw an Exception while looking for the Store Info Data

import 'package:plansubscription/features/plans/data/plans_List_model.dart';
import 'package:plansubscription/features/upgrade_plans/data/upgradeplans_api_service.dart';

class UpgradePlansRepositoryException implements Exception {}

class UpgradePlansRepository {
  UpgradePlansRepository({UpgradePlansApiService? service})
      : _service = service ?? UpgradePlansApiService();
  final UpgradePlansApiService _service;

  Future<PlansListModel> requestUpgradePlans() async {
    try {
      return _service.getUpgradePlansData();
    } on Exception {
      throw UpgradePlansRepositoryException();
    }
  }
}
