// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      modified: json['modified'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      resourceURI: json['resourceURI'] as String?,
      comics: json['comics'] == null
          ? null
          : Comics.fromJson(json['comics'] as Map<String, dynamic>),
      series: json['series'] == null
          ? null
          : Comics.fromJson(json['series'] as Map<String, dynamic>),
      stories: json['stories'] == null
          ? null
          : Comics.fromJson(json['stories'] as Map<String, dynamic>),
      events: json['events'] == null
          ? null
          : Comics.fromJson(json['events'] as Map<String, dynamic>),
      urls: (json['urls'] as List<dynamic>?)
          ?.map((e) => Urls.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'modified': instance.modified,
      'thumbnail': instance.thumbnail,
      'resourceURI': instance.resourceURI,
      'comics': instance.comics,
      'series': instance.series,
      'stories': instance.stories,
      'events': instance.events,
      'urls': instance.urls,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      path: json['path'] as String?,
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };

Comics _$ComicsFromJson(Map<String, dynamic> json) => Comics(
      available: json['available'] as int?,
      collectionURI: json['collectionURI'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      returned: json['returned'] as int?,
    );

Map<String, dynamic> _$ComicsToJson(Comics instance) => <String, dynamic>{
      'available': instance.available,
      'collectionURI': instance.collectionURI,
      'items': instance.items,
      'returned': instance.returned,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      resourceURI: json['resourceURI'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'resourceURI': instance.resourceURI,
      'name': instance.name,
      'type': instance.type,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
    };
