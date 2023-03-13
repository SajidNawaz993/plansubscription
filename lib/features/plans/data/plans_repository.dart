// throw an Exception while looking for the Store Info Data


import 'package:plansubscription/features/plans/data/plans_List_model.dart';
import 'package:plansubscription/features/plans/data/plans_api_service.dart';

class PlansRepositoryException implements Exception {}

class PlansRepository {
  PlansRepository({PlansApiService? service})
      : _service = service ?? PlansApiService();
  final PlansApiService _service;

  Future<PlansListModel> requestPlans() async {
    try {
      return _service.getPlansData();
    } on Exception {
      throw PlansRepositoryException();
    }
  }
}
