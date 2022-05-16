// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponse _$CharactersResponseFromJson(Map<String, dynamic> json) =>
    CharactersResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharactersResponseToJson(CharactersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'results': instance.results,
    };
