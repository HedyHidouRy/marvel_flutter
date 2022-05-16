import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/core/constants/database_constants.dart';
import 'package:marvel/data/data_sources/local/dtos/dtos.dart';
import 'package:marvel/domain/exceptions/exceptions.dart';

@singleton
class CharactersLocalDataSource {
  CharactersLocalDataSource();

  Box get _box => Hive.box(charactersHiveBoxName);

  List<CharacterDto> getAll() {
    try {
      final data = _box.toMap().values;
      if (data.isEmpty) {
        throw NoRecordsException();
      }
      return data.toList().cast<CharacterDto>();
    } catch (_) {
      rethrow;
    }
  }

  Future delete(CharacterDto character) async {
    try {
      await _box.delete(character.id);
    } catch (_) {
      rethrow;
    }
  }

  bool isFavorite(CharacterDto characterDto) {
    try {
      return _box.containsKey(characterDto.id);
    } catch (_) {
      rethrow;
    }
  }

  Future insert(CharacterDto characterDto) async {
    try {
      await _box.put(characterDto.id, characterDto);
    } catch (_) {
      rethrow;
    }
  }

  Future clear() async {
    try {
      await _box.clear();
    } catch (_) {
      rethrow;
    }
  }
}
