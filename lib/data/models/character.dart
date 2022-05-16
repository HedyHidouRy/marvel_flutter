import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/data/data_sources/remote/client/client_config.dart';
import 'package:marvel/data/extensions/domain_converter.dart';
import 'package:marvel/domain/entities/entities.dart' as entities;

part 'character.g.dart';

@JsonSerializable()
class Character with DomainConverter<entities.Character> {
  Character({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  Comics? comics;
  Comics? series;
  Comics? stories;
  Comics? events;
  List<Urls>? urls;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  entities.Character toDmain() => entities.Character(
        id: id ?? 0,
        name: name ?? '',
        description: description ?? '',
        thumbnail:
            "${thumbnail?.path}.${thumbnail?.extension}?apikey=${MarvelClientConfig.apiKey}&hash=${MarvelClientConfig.hash}&ts=${MarvelClientConfig.ts}",
        availaleComics: comics?.available ?? 0,
        availaleEvents: events?.available ?? 0,
        availaleSeries: series?.available ?? 0,
      );
}

@JsonSerializable()
class Thumbnail {
  Thumbnail({this.path, this.extension});

  String? path;
  String? extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable()
class Comics {
  Comics({
    this.available,
    this.collectionURI,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  factory Comics.fromJson(Map<String, dynamic> json) => _$ComicsFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsToJson(this);
}

@JsonSerializable()
class Items {
  Items({
    this.resourceURI,
    this.name,
    this.type,
  });

  String? resourceURI;
  String? name;
  String? type;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Urls {
  Urls({
    this.type,
    this.url,
  });

  String? type;
  String? url;

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
