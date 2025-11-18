import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAssetPriceCall {
  static Future<ApiCallResponse> call({
    String? companyTicker = '',
    String? alphaVantageApiKey = 'VR51DVAHG6KXPWV2',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Asset Price',
      apiUrl:
          'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=${companyTicker}&apikey=${alphaVantageApiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'ticker': companyTicker,
        'apikey': alphaVantageApiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? currentPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$['Global Quote']['05. price']''',
      ));
  static String? change(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$['Global Quote']['09. change']''',
      ));
  static String? changePercent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$['Global Quote']['10. change percent']''',
      ));
}

class GetAssetInfoCall {
  static Future<ApiCallResponse> call({
    String? companyTicker = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Asset Info',
      apiUrl:
          'https://www.alphavantage.co/query?function=OVERVIEW&symbol=${companyTicker}&apikey=VR51DVAHG6KXPWV2',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'ticker': companyTicker,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Name''',
      ));
  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Description''',
      ));
  static String? assetType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.AssetType''',
      ));
  static String? sector(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Sector''',
      ));
  static String? industry(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Industry''',
      ));
  static String? marketCap(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.MarketCapitalization''',
      ));
  static String? pEGRatio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.PEGRatio''',
      ));
  static String? bookValue(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.BookValue''',
      ));
  static String? earningsPerShare(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.EPS''',
      ));
  static String? forwardPE(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ForwardPE''',
      ));
  static String? trailingPE(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.TrailingPE''',
      ));
  static String? ebitda(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.EBITDA''',
      ));
  static String? revenuePerShare(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.RevenuePerShareTTM''',
      ));
  static String? profitMargin(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.ProfitMargin''',
      ));
  static String? revenue(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.RevenueTTM''',
      ));
  static String? profit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.GrossProfitTTM''',
      ));
  static String? dividendPerShare(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DividendPerShare''',
      ));
  static String? dividendYield(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DividendYield''',
      ));
  static String? divPayDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DividendDate''',
      ));
  static String? divExDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ExDividendDate''',
      ));
  static String? earningsGrowthYOY(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.QuarterlyEarningsGrowthYOY''',
      ));
  static String? revenueGrowthYOY(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.QuarterlyRevenueGrowthYOY''',
      ));
}

class SearchCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search',
      apiUrl:
          'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=${input}&apikey=VR51DVAHG6KXPWV2',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'search_input': input,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? ticker(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bestMatches[0]['1. symbol']''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bestMatches[0]['2. name']''',
      ));
  static String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bestMatches[0]['3. type']''',
      ));
  static List? bestSearchMatches(dynamic response) => getJsonField(
        response,
        r'''$.bestMatches''',
        true,
      ) as List?;
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
