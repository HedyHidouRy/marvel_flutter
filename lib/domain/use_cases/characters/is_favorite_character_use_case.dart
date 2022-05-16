import 'package:injectable/injectable.dart';
import 'package:marvel/core/use_case.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/repositories/repositories.dart';

class FavoriteCheckerParam {
  Character character;
  FavoriteCheckerParam({
    required this.character,
  });
}

@injectable
class IsFavoriteCharacterUseCase
    implements UseCase<bool, FavoriteCheckerParam> {
  final CharactersRepository charactersRepository;

  IsFavoriteCharacterUseCase({required this.charactersRepository});

  @override
  Future<bool> call(FavoriteCheckerParam params) =>
      charactersRepository.isFavorite(params.character);
}
