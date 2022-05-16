import 'package:injectable/injectable.dart';
import 'package:marvel/core/use_case.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/domain/repositories/repositories.dart';

class FavoriteDeletionParam {
  Character character;
  FavoriteDeletionParam({
    required this.character,
  });
}

@injectable
class DeleteFavoriteCharacterUseCase
    implements UseCase<void, FavoriteDeletionParam> {
  final CharactersRepository charactersRepository;

  DeleteFavoriteCharacterUseCase({required this.charactersRepository});

  @override
  Future<void> call(FavoriteDeletionParam params) =>
      charactersRepository.deleteFavorite(params.character);
}
