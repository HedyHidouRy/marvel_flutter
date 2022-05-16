import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/config/colors.dart';
import 'package:marvel/domain/entities/character.dart';
import 'package:marvel/presentation/screens/character_details/cubit/character_details_cubit.dart';
import 'package:marvel/routes.dart';

class CharacterDetailsPage extends StatefulWidget {
  final Character character;
  const CharacterDetailsPage(this.character, {Key? key}) : super(key: key);

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  var _shouldReload = false;

  @override
  void initState() {
    super.initState();
    context.read<CharacterDetailsCubit>().getFavoriteState(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
              onPressed: () {
                AppNavigator.pop(result: _shouldReload);
              },
              icon: Icon(Icons.arrow_back_ios)),
          expandedHeight: 350,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: widget.character.id.toString(),
              child: Image.network(
                widget.character.thumbnail,
                width: 120,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: new SliverChildListDelegate(
          [_informationWigdet, _relatedInformation],
        ))
      ]),
    );
  }

  Widget get _informationWigdet =>
      BlocConsumer<CharacterDetailsCubit, CharacterDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final isFavorite =
              state is CharacterDetailsFavoriteState && state.isFavorite;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  widget.character.name,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    _shouldReload = true;
                    context
                        .read<CharacterDetailsCubit>()
                        .toggleFavoriteState(widget.character);
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color:
                          isFavorite ? AppColors.pippin : AppColors.athensGray,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 64,
                ),
                child: Text(
                  widget.character.description.isEmpty
                      ? 'No description available yet'
                      : widget.character.description,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              )
            ],
          );
        },
      );

  Widget get _relatedInformation => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _relatedInformationItem(
              widget.character.availaleComics.toString(), 'Comics'),
          _relatedInformationItem(
              widget.character.availaleEvents.toString(), 'Events'),
          _relatedInformationItem(
              widget.character.availaleSeries.toString(), 'Series'),
        ],
      );

  Widget _relatedInformationItem(String content, String name) => Container(
        width: 90,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              color: Colors.black12,
              offset: Offset(2, 2),
              blurRadius: 20,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(content,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
            Text(name, style: TextStyle(color: Colors.black54, fontSize: 12.0))
          ],
        ),
      );
}
