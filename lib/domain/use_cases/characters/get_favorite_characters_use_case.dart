import 'package:injectable/injectable.dart';

import 'package:marvel/core/use_case.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/repositories/characters_repository.dart';

@injectable
class GetFavoriteCharactersUseCase implements NoParamsUseCase<List<Character>> {
  final CharactersRepository charactersRepository;

  GetFavoriteCharactersUseCase({required this.charactersRepository});

  @override
  Future<List<Character>> call() =>
      charactersRepository.getFavoriteCharacters();
}
