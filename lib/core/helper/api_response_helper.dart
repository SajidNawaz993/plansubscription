import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plansubscription/core/config/extensions.dart';

import '../config/app_exceptions.dart';
import '../config/logger.dart';

dynamic apiResponseHelper({
  required http.Response response,
  required String className,
  required String apiUrl,
  required String requestValue,
}) async {
  // print log the response
  printLog(
    classFileName: className,
    logType: LoggerType.w,
    message:
        'url:$apiUrl\nreq:$requestValue\nres:${response.statusCode}:${response.body}',
  );
  //
  'url:$apiUrl\nreq:$requestValue\nres:${response.statusCode}:${response.body}'
      .log();
  'url:$apiUrl\nreq:$requestValue\nres:${response.statusCode}:${response.body}'
      .log();
  'url:$apiUrl\nreq:$requestValue\nres:${response.statusCode}:${response.body}'
      .log();
  switch (response.statusCode) {
    case 200:
      try {
        return json.decode(response.body);
      } catch (exception, stackTrace) {
        '============ inside jsonDecodeException'.log();
        throw JsonDecodeException();
      }
    case 201:
      try {
        return json.decode(response.body);
      } catch (exception, stackTrace) {
        '============ inside jsonDecodeException'.log();
        throw JsonDecodeException();
      }
    case 202:
      try {
        return json.decode(response.body);
      } catch (exception, stackTrace) {
        '============ inside jsonDecodeException'.log();
        throw JsonDecodeException();
      }
    default:
      final decodedResponse = json.decode(response.body);
      throw HttpException(
          '${decodedResponse['message'] ?? ""} ${decodedResponse['details'] ?? ""} : ${response.statusCode}');
  }
}
