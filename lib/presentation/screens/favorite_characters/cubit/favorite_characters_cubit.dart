import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/exceptions/exceptions.dart';
import 'package:marvel/domain/use_cases/characters/delete_favorite_character_use_case.dart';
import 'package:marvel/domain/use_cases/characters/get_favorite_characters_use_case.dart';
import 'package:marvel/domain/use_cases/characters/save_characters_use_case.dart';

part 'favorite_characters_state.dart';

@injectable
class FavoriteCharactersCubit extends Cubit<FavoriteCharactersState> {
  final GetFavoriteCharactersUseCase _getFavoriteCharactersUseCase;
  final SaveFavoriteCharacterUseCase _saveFavoriteCharacterUseCase;
  final DeleteFavoriteCharacterUseCase _deleteFavoriteCharacterUseCase;

  FavoriteCharactersCubit(
    this._getFavoriteCharactersUseCase,
    this._saveFavoriteCharacterUseCase,
    this._deleteFavoriteCharacterUseCase,
  ) : super(Initial());

  FutureOr<void> getFavorites() async {
    try {
      List<Character> favoriteCharacters =
          await _getFavoriteCharactersUseCase.call();
      emit(FavoritesContent(favoriteCharacters));
    } catch (e) {
      if (e is NoRecordsException) {
        emit(NoFavorites());
      } else {
        emit(FavoritesError());
      }
    }
  }
}
