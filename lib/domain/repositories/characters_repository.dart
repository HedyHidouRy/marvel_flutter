import 'package:marvel/domain/entities/entities.dart';

abstract class CharactersRepository {
  Future<List<Character>> fetchCharacters(int page);
  Future<bool> isFavorite(Character character);
  Future<void> saveFavorite(Character character);
  Future<void> deleteFavorite(Character character);
  Future<void> clearAllFavorite();
  Future<List<Character>> getFavoriteCharacters();
}
