import 'package:dio/dio.dart';
import 'package:marvel/data/data_sources/remote/client/client_config.dart';
import 'package:marvel/data/data_sources/remote/responses/characters_response.dart';
import 'package:retrofit/retrofit.dart';

part 'marvel_client.g.dart';

@RestApi(baseUrl: 'https://gateway.marvel.com:443/v1/public/')
abstract class MarvelClient {
  factory MarvelClient(Dio dio, {String baseUrl}) = _MarvelClient;

  @GET("characters")
  Future<CharactersResponse> getCharacters(
    @Query("offset") int offset, {
    @Query("apikey") String apiKey = MarvelClientConfig.apiKey,
    @Query("hash") String hash = MarvelClientConfig.hash,
    @Query("ts") int ts = MarvelClientConfig.ts,
    @Query("limit") int limit = MarvelClientConfig.pageLimit,
  });
}
