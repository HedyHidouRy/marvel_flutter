import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/config/fonts.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/presentation/screens/favorite_characters/cubit/favorite_characters_cubit.dart';
import 'package:marvel/presentation/widgets/character_card.dart';
import 'package:marvel/presentation/widgets/error_widget.dart';
import 'package:marvel/routes.dart';

class FavoriteCharactersPage extends StatefulWidget {
  const FavoriteCharactersPage({Key? key}) : super(key: key);

  @override
  State<FavoriteCharactersPage> createState() => _FavoriteCharactersPageState();
}

class _FavoriteCharactersPageState extends State<FavoriteCharactersPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCharactersCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        title: Text(
          'Favorite Characters'.toUpperCase(),
          style: marvelStyle.copyWith(color: Colors.red, fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _pageContent,
    );
  }

  Widget get _pageContent =>
      BlocConsumer<FavoriteCharactersCubit, FavoriteCharactersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is FavoritesError) {
              return _errorWidget;
            }

            if (state is NoFavorites) {
              return _emptyWidget;
            }

            List<Character> characters =
                state is FavoritesContent ? state.characters : [];

            return ListView.builder(
              itemBuilder: (context, index) {
                return _characterWidget(characters[index]);
              },
              itemCount: characters.length,
            );
          });

  Widget _characterWidget(Character character) => GestureDetector(
        onTap: () async {
          final bool shouldReload =
              await AppNavigator.push(Routes.characterDetails, character);
          if (shouldReload) {
            context.read<FavoriteCharactersCubit>().getFavorites();
          }
        },
        child: CharacterCard(character: character),
      );

  Widget get _errorWidget => CharactersErrorWidget(
        title: 'Error',
        content: 'Something went wrong, click on retry',
        actionTitle: 'Retry',
        onRetry: () {
          context.read<FavoriteCharactersCubit>().getFavorites();
        },
      );

  Widget get _emptyWidget => CharactersErrorWidget(
        title: 'No Characters Yet',
        content: 'You did not add any character to your favorite list yet',
        actionTitle: 'Back',
        onRetry: () {
          AppNavigator.pop();
        },
      );
}
