import 'package:flutter/material.dart';
import 'package:marvel/config/fonts.dart';
import 'package:marvel/domain/entities/entities.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15.0,
          offset: Offset(-3.0, 10.0),
        )
      ], shape: BoxShape.rectangle, color: Colors.transparent),
      margin: EdgeInsets.fromLTRB(20, 8, 20, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
        child: Container(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: character.id.toString(),
                child: Image.network(
                  character.thumbnail,
                  width: 120,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: extraBoldStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        character.description.isEmpty
                            ? 'No Description'
                            : character.description,
                        style: regularStyle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
