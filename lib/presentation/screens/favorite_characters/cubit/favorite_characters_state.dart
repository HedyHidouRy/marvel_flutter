part of 'favorite_characters_cubit.dart';

@immutable
abstract class FavoriteCharactersState extends Equatable {}

class Initial extends FavoriteCharactersState {
  @override
  List<Object> get props => [];
}

class FavoritesContent extends FavoriteCharactersState {
  final List<Character> characters;

  FavoritesContent(
    this.characters,
  );

  @override
  List<Object> get props => [characters];
}

class NoFavorites extends FavoriteCharactersState {
  NoFavorites();

  @override
  List<Object> get props => [];
}

class FavoritesError extends FavoriteCharactersState {
  FavoritesError();

  @override
  List<Object> get props => [];
}
