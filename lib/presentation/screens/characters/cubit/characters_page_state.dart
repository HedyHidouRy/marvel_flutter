part of 'characters_page_cubit.dart';

@immutable
abstract class CharactersPageState extends Equatable {}

class Initial extends CharactersPageState {
  @override
  List<Object> get props => [];
}

class GetCharactersLoading extends CharactersPageState {
  final bool isFirstLoad;
  final List<Character> oldCharactersContent;

  GetCharactersLoading(
    this.isFirstLoad,
    this.oldCharactersContent,
  );
  @override
  List<Object> get props => [isFirstLoad, oldCharactersContent];
}

class GetCharactersLoaded extends CharactersPageState {
  final List<Character> characters;

  GetCharactersLoaded(
    this.characters,
  );
  @override
  List<Object> get props => [characters];
}

class GetCharactersError extends CharactersPageState {
  @override
  List<Object> get props => [];
}
