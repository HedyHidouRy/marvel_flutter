import 'package:hive_flutter/hive_flutter.dart';
import 'package:marvel/data/extensions/domain_converter.dart';
import 'package:marvel/domain/entities/entities.dart' as entities;

part 'character_dto.g.dart';

@HiveType(typeId: 0)
class CharacterDto with DomainConverter<entities.Character> {
  CharacterDto({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.availaleComics,
    this.availaleSeries,
    this.availaleEvents,
  });

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? thumbnail;
  @HiveField(4)
  final int? availaleComics;
  @HiveField(5)
  final int? availaleSeries;
  @HiveField(6)
  final int? availaleEvents;

  factory CharacterDto.fromDomain(entities.Character character) => CharacterDto(
        id: character.id,
        name: character.name,
        description: character.description,
        thumbnail: character.thumbnail,
        availaleComics: character.availaleComics,
        availaleEvents: character.availaleSeries,
        availaleSeries: character.availaleEvents,
      );

  @override
  entities.Character toDmain() => entities.Character(
        id: id ?? 0,
        name: name ?? '',
        description: description ?? '',
        thumbnail: thumbnail ?? '',
        availaleComics: availaleComics ?? 0,
        availaleEvents: availaleSeries ?? 0,
        availaleSeries: availaleEvents ?? 0,
      );
}
