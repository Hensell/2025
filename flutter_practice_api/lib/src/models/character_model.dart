import 'package:flutter_practice_api/src/models/location_model.dart';

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationModel origin;
  final LocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

  factory CharacterModel.fromJSON(Map<String, dynamic> json) {
    return CharacterModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: LocationModel.fromJSON(json['origin']),
        location: LocationModel.fromJSON(json['location']),
        image: json['image'],
        episode: List<String>.from(json['episode']),
        url: json['url'],
        created: json['created']);
  }
}
