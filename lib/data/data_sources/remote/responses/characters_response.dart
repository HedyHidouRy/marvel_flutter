import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/data/models/character.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  CharactersResponse(
    this.data,
  );

  Data data;

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data(
    this.results,
  );

  List<Character> results;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
