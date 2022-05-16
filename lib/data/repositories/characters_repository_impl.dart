import 'package:injectable/injectable.dart';
import 'package:marvel/data/data_sources/local/characters_local_data_source.dart';
import 'package:marvel/data/data_sources/local/dtos/dtos.dart';
import 'package:marvel/data/data_sources/remote/characters_remote_data_source.dart';
import 'package:marvel/domain/entities/character.dart';
import 'package:marvel/domain/repositories/repositories.dart';

@Singleton(as: CharactersRepository)
class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDataSource remoteDataSource;
  final CharactersLocalDataSource localDataSource;
  CharactersRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<Character>> fetchCharacters(int page) =>
      remoteDataSource.getCharacters(page).then((characters) =>
          characters.map((character) => character.toDmain()).toList());

  @override
  Future<void> clearAllFavorite() => localDataSource.clear();

  @override
  Future<void> deleteFavorite(Character character) =>
      localDataSource.delete(CharacterDto.fromDomain(character));

  @override
  Future<List<Character>> getFavoriteCharacters() => Future.value(
      localDataSource.getAll().map((dto) => dto.toDmain()).toList());

  @override
  Future<bool> isFavorite(Character character) => Future.value(
      localDataSource.isFavorite(CharacterDto.fromDomain(character)));

  @override
  Future<void> saveFavorite(Character character) =>
      localDataSource.insert(CharacterDto.fromDomain(character));
}
