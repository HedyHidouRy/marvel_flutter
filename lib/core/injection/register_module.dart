import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/data/data_sources/remote/client/marvel_client.dart';

@module
abstract class RegisterModule {
  @singleton
  MarvelClient get marvelClient {
    final dio = Dio();

    dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
    return MarvelClient(dio);
  }
}
