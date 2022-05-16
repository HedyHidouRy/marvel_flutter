import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/presentation/screens/character_details/character_details_page.dart';
import 'package:marvel/presentation/screens/character_details/cubit/character_details_cubit.dart';
import 'package:marvel/presentation/screens/characters/characters_page.dart';
import 'package:marvel/presentation/screens/characters/cubit/characters_page_cubit.dart';
import 'package:marvel/presentation/screens/favorite_characters/cubit/favorite_characters_cubit.dart';
import 'package:marvel/presentation/screens/favorite_characters/favorite_characters_page.dart';
import 'package:marvel/presentation/screens/splash/splash.dart';

import 'core/injection/di.dart';

enum Routes { splash, characters, characterDetails, favoriteCharacters }

class _Paths {
  static const String splash = '/';
  static const String characters = '/characters';
  static const String characterDetails = '/characterDetails';
  static const String favoriteCharacters = '/favoriteCharacters';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.characters: _Paths.characters,
    Routes.characterDetails: _Paths.characterDetails,
    Routes.favoriteCharacters: _Paths.favoriteCharacters,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return PageRouteBuilder<void>(pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SplashScreen();
        });
      case _Paths.characters:
        return PageRouteBuilder<void>(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<CharactersPageCubit>(
                  create: (_) => getIt<CharactersPageCubit>(),
                ),
              ],
              child: CharactersPage(),
            );
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Align(
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        );
      case _Paths.characterDetails:
        return PageRouteBuilder<void>(pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<CharacterDetailsCubit>(
                create: (_) => getIt<CharacterDetailsCubit>(),
              ),
            ],
            child: CharacterDetailsPage(settings.arguments as Character),
          );
        });
      case _Paths.favoriteCharacters:
        return PageRouteBuilder<void>(pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<FavoriteCharactersCubit>(
                create: (_) => getIt<FavoriteCharactersCubit>(),
              ),
            ],
            child: FavoriteCharactersPage(),
          );
        });
      default:
        return PageRouteBuilder<void>(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SplashScreen();
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Align(
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        );
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop<T>({T? result = null}) => state?.pop(result);

  static NavigatorState? get state => navigatorKey.currentState;
}
