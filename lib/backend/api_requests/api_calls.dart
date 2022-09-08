import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class ReadCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? name = '',
    String? location = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'read',
      apiUrl:
          'https://us-central1-ezbill-1.cloudfunctions.net/app/api/house/read',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'name': name,
        'location': location,
      },
      returnBody: true,
    );
  }
}
