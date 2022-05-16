import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/config/fonts.dart';
import 'package:marvel/config/images.dart';
import 'package:marvel/domain/entities/entities.dart';
import 'package:marvel/presentation/screens/characters/cubit/characters_page_cubit.dart';
import 'package:marvel/presentation/widgets/character_card.dart';
import 'package:marvel/presentation/widgets/error_widget.dart';
import 'package:marvel/routes.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<CharactersPageCubit>().getCharacters();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter == 0) {
      context.read<CharactersPageCubit>().getCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marvel'.toUpperCase(),
          style: marvelStyle.copyWith(color: Colors.red, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                AppNavigator.push(Routes.favoriteCharacters);
              },
              icon: Icon(
                Icons.bookmark,
                color: Colors.red,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _pageContent,
    );
  }

  Widget get _pageContent =>
      BlocConsumer<CharactersPageCubit, CharactersPageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetCharactersError) {
              return _errorWidget;
            }

            if (state is GetCharactersLoading && state.isFirstLoad) {
              return Center(child: _loadingWidget);
            }

            List<Character> characters = [];
            bool isLoading = false;

            if (state is GetCharactersLoading) {
              characters = state.oldCharactersContent;
              isLoading = true;
            } else if (state is GetCharactersLoaded) {
              characters = state.characters;
            }

            return ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index < characters.length)
                  return _characterWidget(characters[index]);
                else {
                  Timer(Duration(milliseconds: 30), () {
                    _scrollController
                        .jumpTo(_scrollController.position.maxScrollExtent);
                  });
                  return Center(
                    child:
                        Container(width: 70, height: 70, child: _loadingWidget),
                  );
                }
              },
              itemCount: characters.length + (isLoading ? 1 : 0),
            );
          });

  Widget _characterWidget(Character character) => GestureDetector(
        onTap: () {
          AppNavigator.push(Routes.characterDetails, character);
        },
        child: CharacterCard(character: character),
      );

  Widget get _loadingWidget => Image(
        image: AppImages.marvelLoader,
        fit: BoxFit.cover,
        height: 100,
        width: 100,
      );

  Widget get _errorWidget => CharactersErrorWidget(
        title: 'Error',
        content: 'Something went wrong, please try again later',
        actionTitle: 'Retry',
        onRetry: () {
          context.read<CharactersPageCubit>().getCharacters();
        },
      );
}
