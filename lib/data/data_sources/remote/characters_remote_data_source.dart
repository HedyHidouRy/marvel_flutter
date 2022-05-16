import 'package:injectable/injectable.dart';
import 'package:marvel/data/data_sources/remote/client/client_config.dart';
import 'package:marvel/data/data_sources/remote/client/marvel_client.dart';
import 'package:marvel/data/models/models.dart';

@singleton
class CharactersRemoteDataSource {
  MarvelClient _marvelClient;

  CharactersRemoteDataSource(this._marvelClient);

  Future<List<Character>> getCharacters(int page) {
    return _marvelClient
        .getCharacters(page * MarvelClientConfig.pageLimit)
        .then((value) => value.data.results);
  }
}
