// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_sources/local/characters_local_data_source.dart' as _i3;
import '../../data/data_sources/remote/characters_remote_data_source.dart'
    as _i10;
import '../../data/data_sources/remote/client/marvel_client.dart' as _i8;
import '../../data/repositories/characters_repository_impl.dart' as _i12;
import '../../domain/repositories/characters_repository.dart' as _i5;
import '../../domain/repositories/repositories.dart' as _i11;
import '../../domain/use_cases/characters/clear_favorite_characters_use_case.dart'
    as _i4;
import '../../domain/use_cases/characters/delete_favorite_character_use_case.dart'
    as _i13;
import '../../domain/use_cases/characters/get_characters_use_case.dart' as _i6;
import '../../domain/use_cases/characters/get_favorite_characters_use_case.dart'
    as _i7;
import '../../domain/use_cases/characters/is_favorite_character_use_case.dart'
    as _i14;
import '../../domain/use_cases/characters/save_characters_use_case.dart'
    as _i15;
import '../../presentation/screens/character_details/cubit/character_details_cubit.dart'
    as _i16;
import '../../presentation/screens/characters/cubit/characters_page_cubit.dart'
    as _i9;
import '../../presentation/screens/favorite_characters/cubit/favorite_characters_cubit.dart'
    as _i17;
import 'register_module.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.CharactersLocalDataSource>(_i3.CharactersLocalDataSource());
  gh.factory<_i4.ClearFavoriteCharactersUseCase>(() =>
      _i4.ClearFavoriteCharactersUseCase(
          charactersRepository: get<_i5.CharactersRepository>()));
  gh.factory<_i6.GetCharactersUseCase>(() => _i6.GetCharactersUseCase(
      charactersRepository: get<_i5.CharactersRepository>()));
  gh.factory<_i7.GetFavoriteCharactersUseCase>(() =>
      _i7.GetFavoriteCharactersUseCase(
          charactersRepository: get<_i5.CharactersRepository>()));
  gh.singleton<_i8.MarvelClient>(registerModule.marvelClient);
  gh.factory<_i9.CharactersPageCubit>(() => _i9.CharactersPageCubit(
      getCharactersUseCases: get<_i6.GetCharactersUseCase>()));
  gh.singleton<_i10.CharactersRemoteDataSource>(
      _i10.CharactersRemoteDataSource(get<_i8.MarvelClient>()));
  gh.singleton<_i11.CharactersRepository>(_i12.CharactersRepositoryImpl(
      remoteDataSource: get<_i10.CharactersRemoteDataSource>(),
      localDataSource: get<_i3.CharactersLocalDataSource>()));
  gh.factory<_i13.DeleteFavoriteCharacterUseCase>(() =>
      _i13.DeleteFavoriteCharacterUseCase(
          charactersRepository: get<_i11.CharactersRepository>()));
  gh.factory<_i14.IsFavoriteCharacterUseCase>(() =>
      _i14.IsFavoriteCharacterUseCase(
          charactersRepository: get<_i11.CharactersRepository>()));
  gh.factory<_i15.SaveFavoriteCharacterUseCase>(() =>
      _i15.SaveFavoriteCharacterUseCase(
          charactersRepository: get<_i11.CharactersRepository>()));
  gh.factory<_i16.CharacterDetailsCubit>(() => _i16.CharacterDetailsCubit(
      isFavoriteCharacterUseCase: get<_i14.IsFavoriteCharacterUseCase>(),
      saveFavoriteCharacterUseCase: get<_i15.SaveFavoriteCharacterUseCase>(),
      deleteFavoriteCharacterUseCase:
          get<_i13.DeleteFavoriteCharacterUseCase>()));
  gh.factory<_i17.FavoriteCharactersCubit>(() => _i17.FavoriteCharactersCubit(
      get<_i7.GetFavoriteCharactersUseCase>(),
      get<_i15.SaveFavoriteCharacterUseCase>(),
      get<_i13.DeleteFavoriteCharacterUseCase>()));
  return get;
}

class _$RegisterModule extends _i18.RegisterModule {}
