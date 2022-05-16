import 'package:injectable/injectable.dart';

import 'package:marvel/core/use_case.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/repositories/characters_repository.dart';

@injectable
class ClearFavoriteCharactersUseCase implements NoParamsUseCase<void> {
  final CharactersRepository charactersRepository;

  ClearFavoriteCharactersUseCase({required this.charactersRepository});

  @override
  Future<void> call() => charactersRepository.clearAllFavorite();
}
