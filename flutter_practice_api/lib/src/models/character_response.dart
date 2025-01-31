import 'package:flutter_practice_api/src/models/character_model.dart';
import 'package:flutter_practice_api/src/models/info_model.dart';

class CharacterResponse {
  final InfoModel info;
  final List<CharacterModel> results;

  CharacterResponse({required this.info, required this.results});

  factory CharacterResponse.fromJSON(Map<String, dynamic> json) {
    return CharacterResponse(
        info: InfoModel.fromJSON(json['info']),
        results: List<CharacterModel>.from(
            json['results'].map((x) => CharacterModel.fromJSON(x))));
  }
}
