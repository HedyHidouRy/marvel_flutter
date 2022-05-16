import 'package:injectable/injectable.dart';
import 'package:marvel/core/use_case.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/repositories/repositories.dart';

class FavoriteSaverParam {
  Character character;
  FavoriteSaverParam({
    required this.character,
  });
}

@injectable
class SaveFavoriteCharacterUseCase
    implements UseCase<void, FavoriteSaverParam> {
  final CharactersRepository charactersRepository;

  SaveFavoriteCharacterUseCase({required this.charactersRepository});

  @override
  Future<void> call(FavoriteSaverParam params) =>
      charactersRepository.saveFavorite(params.character);
}
