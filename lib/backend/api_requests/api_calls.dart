import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EconomyCallCall {
  static Future<ApiCallResponse> call({
    String? author = '',
    String? title = '',
    String? url = '',
    String? urlToImage = '',
    String? publishedAt = '',
    String? description = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'EconomyCall',
      apiUrl: 'http://api.mediastack.com/v1/news',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_key': "6daf79d9ab692de21bf502a2f2aedc76",
        'languages': "en",
        'categories': "business",
        'sort': "published_desc",
        'limit': "32",
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic articles(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].published_at''',
        true,
      );
  static dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data[:].url''',
        true,
      );
  static dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].title''',
        true,
      );
  static dynamic author(dynamic response) => getJsonField(
        response,
        r'''$.data[:].author''',
        true,
      );
}

class SocietyCallCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'SocietyCall',
      apiUrl: 'http://api.mediastack.com/v1/news',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_key': "6daf79d9ab692de21bf502a2f2aedc76",
        'languages': "en",
        'sort': "published_desc",
        'limit': "32",
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic articles(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].published_at''',
        true,
      );
  static dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data[:].url''',
        true,
      );
  static dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].title''',
        true,
      );
  static dynamic author(dynamic response) => getJsonField(
        response,
        r'''$.data[:].author''',
        true,
      );
}

class TrendingCallCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'TrendingCall',
      apiUrl: 'http://api.mediastack.com/v1/news',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_key': "6daf79d9ab692de21bf502a2f2aedc76",
        'languages': "en",
        'categories': "business",
        'sort': "published_desc",
        'limit': "32",
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic articles(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].published_at''',
        true,
      );
  static dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data[:].url''',
        true,
      );
  static dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].title''',
        true,
      );
  static dynamic author(dynamic response) => getJsonField(
        response,
        r'''$.data[:].author''',
        true,
      );
}

class EnvironmentCallCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'EnvironmentCall',
      apiUrl: 'http://api.mediastack.com/v1/news',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_key': "6daf79d9ab692de21bf502a2f2aedc76",
        'languages': "en",
        'categories': "business",
        'sort': "published_desc",
        'limit': "32",
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic articles(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].published_at''',
        true,
      );
  static dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data[:].url''',
        true,
      );
  static dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].title''',
        true,
      );
  static dynamic author(dynamic response) => getJsonField(
        response,
        r'''$.data[:].author''',
        true,
      );
}

class LocalCallCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Local Call',
      apiUrl: 'google.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
