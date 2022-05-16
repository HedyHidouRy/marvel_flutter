import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/use_cases/characters/delete_favorite_character_use_case.dart';
import 'package:marvel/domain/use_cases/characters/is_favorite_character_use_case.dart';
import 'package:marvel/domain/use_cases/characters/save_characters_use_case.dart';

part 'character_details_state.dart';

@injectable
class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  final IsFavoriteCharacterUseCase isFavoriteCharacterUseCase;
  final SaveFavoriteCharacterUseCase saveFavoriteCharacterUseCase;
  final DeleteFavoriteCharacterUseCase deleteFavoriteCharacterUseCase;

  CharacterDetailsCubit({
    required this.isFavoriteCharacterUseCase,
    required this.saveFavoriteCharacterUseCase,
    required this.deleteFavoriteCharacterUseCase,
  }) : super(Initial());

  FutureOr<void> getFavoriteState(Character character) async {
    bool isFavorite = await isFavoriteCharacterUseCase
        .call(FavoriteCheckerParam(character: character));

    emit(CharacterDetailsFavoriteState(isFavorite));
  }

  FutureOr<void> toggleFavoriteState(Character character) async {
    bool isFavorite = await isFavoriteCharacterUseCase
        .call(FavoriteCheckerParam(character: character));
    if (isFavorite) {
      await deleteFavoriteCharacterUseCase(
          FavoriteDeletionParam(character: character));
    } else {
      await saveFavoriteCharacterUseCase(
          FavoriteSaverParam(character: character));
    }

    emit(CharacterDetailsFavoriteState(!isFavorite));
  }
}
