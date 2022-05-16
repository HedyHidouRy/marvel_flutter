part of 'character_details_cubit.dart';

@immutable
abstract class CharacterDetailsState extends Equatable {}

class Initial extends CharacterDetailsState {
  @override
  List<Object> get props => [];
}

class CharacterDetailsFavoriteState extends CharacterDetailsState {
  final bool isFavorite;

  CharacterDetailsFavoriteState(
    this.isFavorite,
  );
  @override
  List<Object> get props => [isFavorite];
}
