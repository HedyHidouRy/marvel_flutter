// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MarvelClient implements MarvelClient {
  _MarvelClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://gateway.marvel.com:443/v1/public/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CharactersResponse> getCharacters(offset,
      {apiKey = MarvelClientConfig.apiKey,
      hash = MarvelClientConfig.hash,
      ts = MarvelClientConfig.ts,
      limit = MarvelClientConfig.pageLimit}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'offset': offset,
      r'apikey': apiKey,
      r'hash': hash,
      r'ts': ts,
      r'limit': limit
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CharactersResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'characters',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CharactersResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
