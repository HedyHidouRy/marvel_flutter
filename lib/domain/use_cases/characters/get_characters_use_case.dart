import 'package:injectable/injectable.dart';

import 'package:marvel/core/use_case.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/repositories/characters_repository.dart';

class CharactersParam {
  int pageToLoad;
  CharactersParam({
    required this.pageToLoad,
  });
}

@injectable
class GetCharactersUseCase
    implements UseCase<List<Character>, CharactersParam> {
  final CharactersRepository charactersRepository;

  GetCharactersUseCase({required this.charactersRepository});

  @override
  Future<List<Character>> call(CharactersParam params) =>
      charactersRepository.fetchCharacters(params.pageToLoad);
}
