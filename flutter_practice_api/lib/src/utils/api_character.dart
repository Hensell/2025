import 'dart:convert';

import 'package:flutter_practice_api/src/models/character_response.dart';
import 'package:flutter_practice_api/src/utils/constants.dart';
import 'package:http/http.dart' as http;

const api = 'character';

class ApiCharacter {
  Future<CharacterResponse> getData() async {
    final response = await http.get(Uri.parse(Constants.baseApiUrl + api));

    if (response.statusCode == 200) {
      print(CharacterResponse.fromJSON(json.decode(response.body)));
      return CharacterResponse.fromJSON(json.decode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
