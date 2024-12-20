import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:plansubscription/features/data/plans_List_model.dart';
import '../../core/config/app_exceptions.dart';
import '../../core/config/logger.dart';
import '../../core/helper/api_response_helper.dart';
import '../../core/helper/api_url_helpers.dart';
import '../../core/values/string_values.dart';

class PlansApiService {
  final http.Client _httpClient;

  PlansApiService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<PlansListModel> getPlansData() async {
    final responseBody = await _getPlansData();

    try {
      //
      return PlansListModel.fromJson(responseBody);
      //
    } catch (exception, stackTrace) {
      //
      printLog(
        classFileName: 'PlansnApiService',
        logType: LoggerType.e,
        message: '$exception\n$stackTrace',
      );

      //

      //await Sentry.captureException(exception, stackTrace: stackTrace);
      throw JsonDeserializationException(['$exception']);
    }
  }

  /// get Data Functions
  Future<dynamic> _getPlansData() async {
    try {
      final response = await _httpClient.get(
        Uri.parse(planListApi),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      //
      return apiResponseHelper(
        response: response,
        className: 'PlansApiService',
        apiUrl: planListApi,
        requestValue: '',
      );
      //

    } on SocketException {
      //
      throw HttpException(StringValues.no_internet);
      //
    } catch (exception) {
      //
      //await Sentry.captureException(exception, stackTrace: stackTrace);

      throw HttpException('Error Communicating with Server');
      //

    }
  }
}
