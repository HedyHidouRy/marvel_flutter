import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/use_cases/characters/get_characters_use_case.dart';

part 'characters_page_state.dart';

@injectable
class CharactersPageCubit extends Cubit<CharactersPageState> {
  final GetCharactersUseCase getCharactersUseCases;

  int page = 0;

  CharactersPageCubit({
    required this.getCharactersUseCases,
  }) : super(Initial());

  FutureOr<void> getCharacters() async {
    if (state is GetCharactersLoading) return;

    final currentState = state;

    var currentCharactersContent = <Character>[];

    if (currentState is GetCharactersLoaded) {
      currentCharactersContent = currentState.characters;
    }

    emit(GetCharactersLoading(
        currentCharactersContent.isEmpty, currentCharactersContent));

    try {
      final characters =
          await getCharactersUseCases.call(CharactersParam(pageToLoad: page));
      page++;
      currentCharactersContent.addAll(characters);
      emit(GetCharactersLoaded(currentCharactersContent));
    } catch (e) {
      emit(GetCharactersError());
    }
  }
}
